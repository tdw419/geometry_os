; DESCRIPTION: Places a yellow 108x85 rectangle at position (250, 21).
; PLAN: r0=250(x), r1=21(y), r2=108(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 21
LDI r2, 108
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
