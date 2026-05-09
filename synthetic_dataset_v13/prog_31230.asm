; DESCRIPTION: Renders a orange box of size 96x19 starting at (336, 141).
; PLAN: r0=336(x), r1=141(y), r2=96(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 141
LDI r2, 96
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
