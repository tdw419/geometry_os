; DESCRIPTION: Renders a orange box of size 91x27 starting at (162, 161).
; PLAN: r0=162(x), r1=161(y), r2=91(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 161
LDI r2, 91
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
