; DESCRIPTION: Renders a orange box of size 78x68 starting at (66, 44).
; PLAN: r0=66(x), r1=44(y), r2=78(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 44
LDI r2, 78
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
