; DESCRIPTION: Composite: Renders a blue line between points (169, 152) and (182, 53) then Draws a cyan circle centered at (275, 123) with radius 17.
; PLAN: r0=169(x1), r1=152(y1), r2=182(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=123(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 152
LDI r2, 182
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 123
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
