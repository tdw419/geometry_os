; DESCRIPTION: Renders a orange box of size 96x74 starting at (204, 161).
; PLAN: r0=204(x), r1=161(y), r2=96(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 161
LDI r2, 96
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
