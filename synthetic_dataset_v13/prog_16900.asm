; DESCRIPTION: Places a green 90x14 rectangle at position (149, 164).
; PLAN: r0=149(x), r1=164(y), r2=90(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 164
LDI r2, 90
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
