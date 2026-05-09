; DESCRIPTION: Places a green 65x80 rectangle at position (416, 158).
; PLAN: r0=416(x), r1=158(y), r2=65(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 158
LDI r2, 65
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
