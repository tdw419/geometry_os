; DESCRIPTION: Renders a orange box of size 75x44 starting at (389, 149).
; PLAN: r0=389(x), r1=149(y), r2=75(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 149
LDI r2, 75
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
