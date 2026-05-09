; DESCRIPTION: Renders a green box of size 57x49 starting at (322, 184).
; PLAN: r0=322(x), r1=184(y), r2=57(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 184
LDI r2, 57
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
