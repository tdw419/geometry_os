; DESCRIPTION: Renders a orange box of size 91x22 starting at (349, 27).
; PLAN: r0=349(x), r1=27(y), r2=91(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 27
LDI r2, 91
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
