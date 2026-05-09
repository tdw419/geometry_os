; DESCRIPTION: Places a blue 75x72 rectangle at position (149, 167).
; PLAN: r0=149(x), r1=167(y), r2=75(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 167
LDI r2, 75
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
