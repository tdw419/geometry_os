; DESCRIPTION: Renders a green box of size 99x102 starting at (198, 29).
; PLAN: r0=198(x), r1=29(y), r2=99(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 29
LDI r2, 99
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
