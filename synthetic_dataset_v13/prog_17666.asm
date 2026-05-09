; DESCRIPTION: Places a green 85x108 rectangle at position (393, 81).
; PLAN: r0=393(x), r1=81(y), r2=85(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 81
LDI r2, 85
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
