; DESCRIPTION: Places a yellow 78x84 rectangle at position (120, 168).
; PLAN: r0=120(x), r1=168(y), r2=78(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 168
LDI r2, 78
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
