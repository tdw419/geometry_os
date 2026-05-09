; DESCRIPTION: Renders a green box of size 84x111 starting at (129, 57).
; PLAN: r0=129(x), r1=57(y), r2=84(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 57
LDI r2, 84
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
