; DESCRIPTION: Places a yellow 63x50 rectangle at position (47, 168).
; PLAN: r0=47(x), r1=168(y), r2=63(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 168
LDI r2, 63
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
