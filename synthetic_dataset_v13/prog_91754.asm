; DESCRIPTION: Renders a green box of size 113x28 starting at (118, 54).
; PLAN: r0=118(x), r1=54(y), r2=113(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 54
LDI r2, 113
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
