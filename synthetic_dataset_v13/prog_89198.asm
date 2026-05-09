; DESCRIPTION: Renders a blue box of size 20x115 starting at (285, 48).
; PLAN: r0=285(x), r1=48(y), r2=20(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 48
LDI r2, 20
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
