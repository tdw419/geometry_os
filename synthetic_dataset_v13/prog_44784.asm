; DESCRIPTION: Renders a orange box of size 65x33 starting at (27, 79).
; PLAN: r0=27(x), r1=79(y), r2=65(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 79
LDI r2, 65
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
