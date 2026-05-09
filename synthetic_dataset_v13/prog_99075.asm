; DESCRIPTION: Places a green 85x22 rectangle at position (220, 45).
; PLAN: r0=220(x), r1=45(y), r2=85(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 45
LDI r2, 85
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
