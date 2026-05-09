; DESCRIPTION: Places a green 75x54 rectangle at position (149, 108).
; PLAN: r0=149(x), r1=108(y), r2=75(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 108
LDI r2, 75
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
