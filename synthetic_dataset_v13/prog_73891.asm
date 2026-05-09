; DESCRIPTION: Renders a yellow box of size 87x101 starting at (420, 37).
; PLAN: r0=420(x), r1=37(y), r2=87(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 37
LDI r2, 87
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
