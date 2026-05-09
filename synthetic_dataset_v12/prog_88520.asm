; DESCRIPTION: Composite: Renders a magenta disk with center (466, 132) and radius 35 then Renders a black box of size 94x103 starting at (290, 4).
; PLAN: r0=466(x), r1=132(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=4(y), r7=94(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 132
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 4
LDI r7, 94
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
