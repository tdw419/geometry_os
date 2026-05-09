; DESCRIPTION: Renders a yellow box of size 39x111 starting at (57, 5).
; PLAN: r0=57(x), r1=5(y), r2=39(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 5
LDI r2, 39
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
