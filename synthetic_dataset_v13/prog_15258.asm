; DESCRIPTION: Composite: Renders a blue disk with center (373, 195) and radius 27 then Places a orange 99x81 rectangle at position (71, 31) then Places a blue line segment connecting (417, 140) to (275, 100).
; PLAN: r0=373(x), r1=195(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=31(y), r7=99(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x1), r11=140(y1), r12=275(x2), r13=100(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 195
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 31
LDI r7, 99
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 140
LDI r12, 275
LDI r13, 100
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
