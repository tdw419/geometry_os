; DESCRIPTION: Renders a yellow box of size 106x24 starting at (386, 29).
; PLAN: r0=386(x), r1=29(y), r2=106(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 29
LDI r2, 106
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
