; DESCRIPTION: Renders a orange box of size 65x20 starting at (216, 94).
; PLAN: r0=216(x), r1=94(y), r2=65(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 94
LDI r2, 65
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
