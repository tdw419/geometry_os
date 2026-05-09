; DESCRIPTION: Places a yellow 85x61 rectangle at position (206, 145).
; PLAN: r0=206(x), r1=145(y), r2=85(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 145
LDI r2, 85
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
