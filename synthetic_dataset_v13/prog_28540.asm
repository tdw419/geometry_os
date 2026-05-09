; DESCRIPTION: Renders a green box of size 54x107 starting at (116, 34).
; PLAN: r0=116(x), r1=34(y), r2=54(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 34
LDI r2, 54
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
