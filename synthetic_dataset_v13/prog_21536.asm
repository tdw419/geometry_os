; DESCRIPTION: Composite: Draws a cyan line from (280, 198) to (203, 135) then Renders a blue disk with center (339, 117) and radius 40.
; PLAN: r0=280(x1), r1=198(y1), r2=203(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=117(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 198
LDI r2, 203
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 117
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
