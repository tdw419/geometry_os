; DESCRIPTION: Renders a blue box of size 91x61 starting at (361, 64).
; PLAN: r0=361(x), r1=64(y), r2=91(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 64
LDI r2, 91
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
