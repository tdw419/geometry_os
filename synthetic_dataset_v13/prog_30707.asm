; DESCRIPTION: Renders a orange box of size 65x54 starting at (389, 161).
; PLAN: r0=389(x), r1=161(y), r2=65(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 161
LDI r2, 65
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
