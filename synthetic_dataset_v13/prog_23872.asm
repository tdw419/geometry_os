; DESCRIPTION: Places a cyan 60x20 rectangle at position (399, 155).
; PLAN: r0=399(x), r1=155(y), r2=60(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 155
LDI r2, 60
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
