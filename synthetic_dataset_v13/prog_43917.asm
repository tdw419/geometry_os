; DESCRIPTION: Renders a yellow box of size 64x115 starting at (323, 23).
; PLAN: r0=323(x), r1=23(y), r2=64(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 23
LDI r2, 64
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
