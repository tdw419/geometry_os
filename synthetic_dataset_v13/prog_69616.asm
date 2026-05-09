; DESCRIPTION: Renders a yellow box of size 90x39 starting at (382, 56).
; PLAN: r0=382(x), r1=56(y), r2=90(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 56
LDI r2, 90
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
