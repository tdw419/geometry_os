; DESCRIPTION: Renders a orange box of size 17x57 starting at (480, 149).
; PLAN: r0=480(x), r1=149(y), r2=17(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 149
LDI r2, 17
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
