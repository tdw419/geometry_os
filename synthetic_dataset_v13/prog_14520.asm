; DESCRIPTION: Places a green 91x65 rectangle at position (132, 3).
; PLAN: r0=132(x), r1=3(y), r2=91(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 3
LDI r2, 91
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
