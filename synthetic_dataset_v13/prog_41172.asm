; DESCRIPTION: Renders a green box of size 13x30 starting at (129, 198).
; PLAN: r0=129(x), r1=198(y), r2=13(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 198
LDI r2, 13
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
