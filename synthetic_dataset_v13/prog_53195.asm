; DESCRIPTION: Renders a yellow box of size 70x10 starting at (106, 56).
; PLAN: r0=106(x), r1=56(y), r2=70(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 56
LDI r2, 70
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
