; DESCRIPTION: Places a yellow 16x79 rectangle at position (416, 133).
; PLAN: r0=416(x), r1=133(y), r2=16(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 133
LDI r2, 16
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
