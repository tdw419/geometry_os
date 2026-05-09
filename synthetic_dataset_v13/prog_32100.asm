; DESCRIPTION: Composite: Creates a purple rectangular region at (135, 74) spanning 65 by 17 pixels then Places a purple line segment connecting (236, 124) to (202, 185) then Renders a white disk with center (310, 125) and radius 39.
; PLAN: r0=135(x), r1=74(y), r2=65(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=124(y1), r7=202(x2), r8=185(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=125(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 135
LDI r1, 74
LDI r2, 65
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 124
LDI r7, 202
LDI r8, 185
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 125
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
