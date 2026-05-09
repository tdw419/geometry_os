; DESCRIPTION: Places a green 91x26 rectangle at position (243, 23).
; PLAN: r0=243(x), r1=23(y), r2=91(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 23
LDI r2, 91
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
