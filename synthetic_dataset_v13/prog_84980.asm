; DESCRIPTION: Renders a green box of size 52x47 starting at (136, 207).
; PLAN: r0=136(x), r1=207(y), r2=52(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 207
LDI r2, 52
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
