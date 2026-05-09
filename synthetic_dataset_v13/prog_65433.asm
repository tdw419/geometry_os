; DESCRIPTION: Renders a blue box of size 77x120 starting at (263, 32).
; PLAN: r0=263(x), r1=32(y), r2=77(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 32
LDI r2, 77
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
