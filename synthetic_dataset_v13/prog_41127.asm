; DESCRIPTION: Renders a orange box of size 31x96 starting at (179, 17).
; PLAN: r0=179(x), r1=17(y), r2=31(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 17
LDI r2, 31
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
