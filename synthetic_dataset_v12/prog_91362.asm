; DESCRIPTION: Renders a green box of size 86x59 starting at (132, 13).
; PLAN: r0=132(x), r1=13(y), r2=86(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 13
LDI r2, 86
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
