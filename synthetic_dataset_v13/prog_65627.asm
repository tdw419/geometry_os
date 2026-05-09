; DESCRIPTION: Renders a yellow box of size 119x44 starting at (29, 113).
; PLAN: r0=29(x), r1=113(y), r2=119(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 113
LDI r2, 119
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
