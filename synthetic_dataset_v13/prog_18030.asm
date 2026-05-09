; DESCRIPTION: Renders a orange box of size 97x67 starting at (393, 64).
; PLAN: r0=393(x), r1=64(y), r2=97(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 64
LDI r2, 97
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
