; DESCRIPTION: Places a yellow 95x95 rectangle at position (231, 84).
; PLAN: r0=231(x), r1=84(y), r2=95(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 84
LDI r2, 95
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
