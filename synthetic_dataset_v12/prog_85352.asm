; DESCRIPTION: Composite: Draws a yellow line from (243, 153) to (381, 124) then Places a orange circle of radius 50 at center (370, 134).
; PLAN: r0=243(x1), r1=153(y1), r2=381(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=134(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 153
LDI r2, 381
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 134
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
