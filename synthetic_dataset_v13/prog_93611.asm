; DESCRIPTION: Renders a green box of size 118x98 starting at (24, 92).
; PLAN: r0=24(x), r1=92(y), r2=118(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 92
LDI r2, 118
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
