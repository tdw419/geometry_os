; DESCRIPTION: Renders a orange box of size 35x99 starting at (273, 27).
; PLAN: r0=273(x), r1=27(y), r2=35(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 27
LDI r2, 35
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
