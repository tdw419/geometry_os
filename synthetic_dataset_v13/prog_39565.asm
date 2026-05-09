; DESCRIPTION: Composite: Renders a blue box of size 109x50 starting at (290, 129) then Sets a single magenta pixel at (159, 180) then Renders a green disk with center (168, 61) and radius 51.
; PLAN: r0=290(x), r1=129(y), r2=109(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=180(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=61(y), r12=51(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 129
LDI r2, 109
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 180
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 61
LDI r12, 51
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
