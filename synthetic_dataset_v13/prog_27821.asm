; DESCRIPTION: Renders a red box of size 97x66 starting at (107, 128).
; PLAN: r0=107(x), r1=128(y), r2=97(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 128
LDI r2, 97
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
