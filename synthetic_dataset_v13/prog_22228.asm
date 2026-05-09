; DESCRIPTION: Places a green 95x62 rectangle at position (24, 84).
; PLAN: r0=24(x), r1=84(y), r2=95(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 84
LDI r2, 95
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
