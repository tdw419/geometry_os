; DESCRIPTION: Composite: Draws a yellow line from (153, 31) to (240, 70) then Renders a yellow disk with center (320, 69) and radius 31.
; PLAN: r0=153(x1), r1=31(y1), r2=240(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=69(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 153
LDI r1, 31
LDI r2, 240
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 69
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
