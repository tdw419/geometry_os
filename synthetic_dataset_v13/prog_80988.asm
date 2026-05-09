; DESCRIPTION: Renders a white box of size 58x59 starting at (364, 6).
; PLAN: r0=364(x), r1=6(y), r2=58(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 6
LDI r2, 58
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
