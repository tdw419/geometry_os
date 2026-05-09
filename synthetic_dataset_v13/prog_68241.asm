; DESCRIPTION: Renders a orange box of size 45x14 starting at (450, 187).
; PLAN: r0=450(x), r1=187(y), r2=45(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 187
LDI r2, 45
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
