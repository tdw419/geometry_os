; DESCRIPTION: Renders a green box of size 53x116 starting at (127, 58).
; PLAN: r0=127(x), r1=58(y), r2=53(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 58
LDI r2, 53
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
