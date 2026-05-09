; DESCRIPTION: Renders a green box of size 91x83 starting at (123, 30).
; PLAN: r0=123(x), r1=30(y), r2=91(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 30
LDI r2, 91
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
