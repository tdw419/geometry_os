; DESCRIPTION: Renders a blue box of size 102x77 starting at (265, 32).
; PLAN: r0=265(x), r1=32(y), r2=102(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 32
LDI r2, 102
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
