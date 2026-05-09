; DESCRIPTION: Composite: Places a black line segment connecting (357, 69) to (187, 108) then Renders a cyan disk with center (482, 130) and radius 15.
; PLAN: r0=357(x1), r1=69(y1), r2=187(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=482(x), r6=130(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 69
LDI r2, 187
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 130
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
