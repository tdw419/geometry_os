; DESCRIPTION: Composite: Draws a white line from (177, 118) to (175, 228) then Places a white dot at position (350, 161).
; PLAN: r0=177(x1), r1=118(y1), r2=175(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 118
LDI r2, 175
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
