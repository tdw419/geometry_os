; DESCRIPTION: Renders a yellow box of size 39x40 starting at (56, 171).
; PLAN: r0=56(x), r1=171(y), r2=39(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 171
LDI r2, 39
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
