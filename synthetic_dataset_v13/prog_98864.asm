; DESCRIPTION: Renders a green box of size 83x50 starting at (162, 3).
; PLAN: r0=162(x), r1=3(y), r2=83(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 3
LDI r2, 83
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
