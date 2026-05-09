; DESCRIPTION: Places a green 20x109 rectangle at position (149, 18).
; PLAN: r0=149(x), r1=18(y), r2=20(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 18
LDI r2, 20
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
