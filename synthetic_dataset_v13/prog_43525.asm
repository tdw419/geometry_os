; DESCRIPTION: Renders a white box of size 64x30 starting at (356, 132).
; PLAN: r0=356(x), r1=132(y), r2=64(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 132
LDI r2, 64
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
