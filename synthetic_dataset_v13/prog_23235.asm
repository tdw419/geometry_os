; DESCRIPTION: Renders a green box of size 91x92 starting at (226, 6).
; PLAN: r0=226(x), r1=6(y), r2=91(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 6
LDI r2, 91
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
