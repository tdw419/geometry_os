; DESCRIPTION: Places a yellow 90x87 rectangle at position (201, 38).
; PLAN: r0=201(x), r1=38(y), r2=90(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 38
LDI r2, 90
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
