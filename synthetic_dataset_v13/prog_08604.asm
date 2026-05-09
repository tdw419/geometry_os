; DESCRIPTION: Renders a green box of size 59x22 starting at (198, 102).
; PLAN: r0=198(x), r1=102(y), r2=59(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 102
LDI r2, 59
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
