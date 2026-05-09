; DESCRIPTION: Composite: Places a cyan line segment connecting (207, 14) to (424, 146) then Places a orange dot at position (40, 186).
; PLAN: r0=207(x1), r1=14(y1), r2=424(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=186(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 14
LDI r2, 424
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 186
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
