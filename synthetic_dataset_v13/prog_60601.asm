; DESCRIPTION: Renders a yellow box of size 98x116 starting at (135, 127).
; PLAN: r0=135(x), r1=127(y), r2=98(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 127
LDI r2, 98
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
