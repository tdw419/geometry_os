; DESCRIPTION: Renders a orange box of size 13x28 starting at (349, 127).
; PLAN: r0=349(x), r1=127(y), r2=13(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 127
LDI r2, 13
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
