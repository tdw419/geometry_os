; DESCRIPTION: Places a blue 38x22 rectangle at position (201, 223).
; PLAN: r0=201(x), r1=223(y), r2=38(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 223
LDI r2, 38
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
