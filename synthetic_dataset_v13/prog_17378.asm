; DESCRIPTION: Composite: Renders a red disk with center (243, 76) and radius 72 then Creates a green rectangular region at (396, 81) spanning 93 by 92 pixels then Sets a single magenta pixel at (307, 245).
; PLAN: r0=243(x), r1=76(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=81(y), r7=93(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=245(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 76
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 81
LDI r7, 93
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 245
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
