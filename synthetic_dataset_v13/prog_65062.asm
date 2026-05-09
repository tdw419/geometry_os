; DESCRIPTION: Composite: Sets a single magenta pixel at (329, 185) then Renders a red box of size 93x44 starting at (90, 176) then Renders a black disk with center (98, 131) and radius 18.
; PLAN: r0=329(x), r1=185(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=176(y), r7=93(width), r8=44(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x), r11=131(y), r12=18(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 185
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 176
LDI r7, 93
LDI r8, 44
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 131
LDI r12, 18
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
