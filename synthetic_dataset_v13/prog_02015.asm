; DESCRIPTION: Places a green 60x68 rectangle at position (140, 120).
; PLAN: r0=140(x), r1=120(y), r2=60(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 120
LDI r2, 60
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
