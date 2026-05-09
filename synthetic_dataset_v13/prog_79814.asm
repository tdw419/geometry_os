; DESCRIPTION: Renders a magenta box of size 21x32 starting at (448, 218).
; PLAN: r0=448(x), r1=218(y), r2=21(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 218
LDI r2, 21
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
