; DESCRIPTION: Renders a green box of size 12x62 starting at (124, 83).
; PLAN: r0=124(x), r1=83(y), r2=12(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 83
LDI r2, 12
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
