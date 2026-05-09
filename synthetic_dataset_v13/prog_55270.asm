; DESCRIPTION: Renders a green box of size 83x59 starting at (264, 36).
; PLAN: r0=264(x), r1=36(y), r2=83(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 36
LDI r2, 83
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
