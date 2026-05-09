; DESCRIPTION: Renders a green box of size 35x22 starting at (14, 143).
; PLAN: r0=14(x), r1=143(y), r2=35(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 143
LDI r2, 35
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
