; DESCRIPTION: Composite: Renders a blue disk with center (135, 152) and radius 69 then Places a cyan line segment connecting (13, 230) to (81, 250).
; PLAN: r0=135(x), r1=152(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x1), r6=230(y1), r7=81(x2), r8=250(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 152
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 230
LDI r7, 81
LDI r8, 250
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
