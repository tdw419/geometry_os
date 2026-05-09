; DESCRIPTION: Places a yellow 12x16 rectangle at position (423, 149).
; PLAN: r0=423(x), r1=149(y), r2=12(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 149
LDI r2, 12
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
