; DESCRIPTION: Renders a orange box of size 85x68 starting at (292, 164).
; PLAN: r0=292(x), r1=164(y), r2=85(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 164
LDI r2, 85
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
