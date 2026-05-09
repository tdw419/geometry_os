; DESCRIPTION: Renders a blue box of size 27x61 starting at (356, 184).
; PLAN: r0=356(x), r1=184(y), r2=27(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 184
LDI r2, 27
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
