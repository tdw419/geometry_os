; DESCRIPTION: Renders a orange box of size 105x94 starting at (32, 128).
; PLAN: r0=32(x), r1=128(y), r2=105(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 128
LDI r2, 105
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
