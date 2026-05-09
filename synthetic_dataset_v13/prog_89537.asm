; DESCRIPTION: Renders a orange box of size 14x13 starting at (193, 168).
; PLAN: r0=193(x), r1=168(y), r2=14(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 168
LDI r2, 14
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
