; DESCRIPTION: Renders a orange box of size 120x99 starting at (65, 156).
; PLAN: r0=65(x), r1=156(y), r2=120(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 156
LDI r2, 120
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
