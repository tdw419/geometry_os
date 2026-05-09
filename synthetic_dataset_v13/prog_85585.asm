; DESCRIPTION: Renders a yellow box of size 106x90 starting at (136, 16).
; PLAN: r0=136(x), r1=16(y), r2=106(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 16
LDI r2, 106
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
