; DESCRIPTION: Renders a yellow box of size 106x48 starting at (313, 144).
; PLAN: r0=313(x), r1=144(y), r2=106(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 144
LDI r2, 106
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
