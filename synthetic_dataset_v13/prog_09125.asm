; DESCRIPTION: Places a green 22x21 rectangle at position (470, 158).
; PLAN: r0=470(x), r1=158(y), r2=22(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 158
LDI r2, 22
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
