; DESCRIPTION: Places a green 95x76 rectangle at position (176, 155).
; PLAN: r0=176(x), r1=155(y), r2=95(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 155
LDI r2, 95
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
