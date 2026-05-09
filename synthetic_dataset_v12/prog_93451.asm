; DESCRIPTION: Renders a blue box of size 112x61 starting at (335, 32).
; PLAN: r0=335(x), r1=32(y), r2=112(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 32
LDI r2, 112
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
