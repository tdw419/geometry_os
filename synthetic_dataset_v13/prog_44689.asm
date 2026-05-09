; DESCRIPTION: Renders a green box of size 95x107 starting at (34, 57).
; PLAN: r0=34(x), r1=57(y), r2=95(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 57
LDI r2, 95
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
