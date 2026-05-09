; DESCRIPTION: Renders a orange box of size 81x11 starting at (267, 162).
; PLAN: r0=267(x), r1=162(y), r2=81(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 162
LDI r2, 81
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
