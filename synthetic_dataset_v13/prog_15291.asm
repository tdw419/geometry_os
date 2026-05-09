; DESCRIPTION: Renders a green box of size 15x25 starting at (364, 16).
; PLAN: r0=364(x), r1=16(y), r2=15(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 16
LDI r2, 15
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
