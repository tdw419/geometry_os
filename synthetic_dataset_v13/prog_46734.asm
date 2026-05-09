; DESCRIPTION: Renders a yellow box of size 14x109 starting at (127, 90).
; PLAN: r0=127(x), r1=90(y), r2=14(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 90
LDI r2, 14
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
