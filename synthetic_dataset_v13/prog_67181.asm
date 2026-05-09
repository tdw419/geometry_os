; DESCRIPTION: Renders a magenta box of size 30x103 starting at (128, 94).
; PLAN: r0=128(x), r1=94(y), r2=30(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 94
LDI r2, 30
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
