; DESCRIPTION: Renders a green box of size 96x79 starting at (101, 165).
; PLAN: r0=101(x), r1=165(y), r2=96(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 165
LDI r2, 96
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
