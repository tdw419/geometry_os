; DESCRIPTION: Places a orange 33x80 rectangle at position (231, 168).
; PLAN: r0=231(x), r1=168(y), r2=33(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 168
LDI r2, 33
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
