; DESCRIPTION: Renders a orange box of size 87x98 starting at (40, 94).
; PLAN: r0=40(x), r1=94(y), r2=87(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 94
LDI r2, 87
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
