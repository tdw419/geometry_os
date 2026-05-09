; DESCRIPTION: Composite: Draws a blue line from (77, 124) to (344, 10) then Places a green dot at position (281, 34).
; PLAN: r0=77(x1), r1=124(y1), r2=344(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=34(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 124
LDI r2, 344
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 34
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
