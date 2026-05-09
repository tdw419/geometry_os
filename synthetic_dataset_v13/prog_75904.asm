; DESCRIPTION: Renders a orange box of size 78x87 starting at (182, 45).
; PLAN: r0=182(x), r1=45(y), r2=78(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 45
LDI r2, 78
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
