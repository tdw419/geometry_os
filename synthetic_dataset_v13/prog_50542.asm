; DESCRIPTION: Places a green 13x24 rectangle at position (22, 65).
; PLAN: r0=22(x), r1=65(y), r2=13(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 65
LDI r2, 13
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
