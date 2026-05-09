; DESCRIPTION: Renders a orange box of size 101x48 starting at (121, 172).
; PLAN: r0=121(x), r1=172(y), r2=101(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 172
LDI r2, 101
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
