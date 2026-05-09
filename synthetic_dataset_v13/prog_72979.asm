; DESCRIPTION: Renders a green box of size 62x83 starting at (9, 59).
; PLAN: r0=9(x), r1=59(y), r2=62(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 59
LDI r2, 62
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
