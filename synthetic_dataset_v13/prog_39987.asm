; DESCRIPTION: Renders a black box of size 112x87 starting at (268, 128).
; PLAN: r0=268(x), r1=128(y), r2=112(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 128
LDI r2, 112
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
