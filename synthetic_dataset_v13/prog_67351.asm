; DESCRIPTION: Composite: Sets a single magenta pixel at (289, 226) then Creates a red circular shape at (242, 106) with radius 73 then Renders a green box of size 58x116 starting at (80, 76).
; PLAN: r0=289(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=106(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x), r11=76(y), r12=58(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 106
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 76
LDI r12, 58
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
