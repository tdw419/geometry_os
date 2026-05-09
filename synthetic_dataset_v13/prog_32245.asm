; DESCRIPTION: Renders a green box of size 64x74 starting at (407, 19).
; PLAN: r0=407(x), r1=19(y), r2=64(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 19
LDI r2, 64
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
