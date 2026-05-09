; DESCRIPTION: Renders a orange box of size 10x13 starting at (146, 161).
; PLAN: r0=146(x), r1=161(y), r2=10(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 161
LDI r2, 10
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
