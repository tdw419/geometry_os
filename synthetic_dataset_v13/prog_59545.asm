; DESCRIPTION: Renders a yellow box of size 29x99 starting at (57, 56).
; PLAN: r0=57(x), r1=56(y), r2=29(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 56
LDI r2, 29
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
