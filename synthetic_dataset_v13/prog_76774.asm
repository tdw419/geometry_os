; DESCRIPTION: Composite: Sets a single red pixel at (507, 193) then Renders a green disk with center (383, 128) and radius 71 then Places a magenta line segment connecting (253, 102) to (81, 222).
; PLAN: r0=507(x), r1=193(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=128(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x1), r11=102(y1), r12=81(x2), r13=222(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 193
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 383
LDI r6, 128
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 102
LDI r12, 81
LDI r13, 222
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
