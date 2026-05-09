; DESCRIPTION: Composite: Renders a white disk with center (382, 67) and radius 12 then Places a magenta dot at position (140, 174) then Places a cyan line segment connecting (129, 123) to (256, 134).
; PLAN: r0=382(x), r1=67(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=174(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=129(x1), r11=123(y1), r12=256(x2), r13=134(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 67
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 174
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 123
LDI r12, 256
LDI r13, 134
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
