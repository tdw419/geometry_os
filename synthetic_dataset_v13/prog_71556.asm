; DESCRIPTION: Composite: Draws a cyan line from (105, 124) to (124, 146) then Places a purple dot at position (217, 98) then Places a green circle of radius 70 at center (162, 172).
; PLAN: r0=105(x1), r1=124(y1), r2=124(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=98(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=162(x), r11=172(y), r12=70(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 124
LDI r2, 124
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 98
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 162
LDI r11, 172
LDI r12, 70
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
