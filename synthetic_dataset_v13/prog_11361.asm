; DESCRIPTION: Renders a green box of size 68x57 starting at (322, 56).
; PLAN: r0=322(x), r1=56(y), r2=68(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 56
LDI r2, 68
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
