; DESCRIPTION: Places a green 63x89 rectangle at position (140, 50).
; PLAN: r0=140(x), r1=50(y), r2=63(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 50
LDI r2, 63
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
