; DESCRIPTION: Composite: Places a cyan line segment connecting (245, 152) to (134, 124) then Renders a green disk with center (346, 130) and radius 73 then Places a blue dot at position (472, 159).
; PLAN: r0=245(x1), r1=152(y1), r2=134(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=130(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=472(x), r11=159(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 152
LDI r2, 134
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 130
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 472
LDI r11, 159
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
