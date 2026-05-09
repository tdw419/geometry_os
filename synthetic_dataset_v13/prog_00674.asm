; DESCRIPTION: Places a green 60x38 rectangle at position (107, 181).
; PLAN: r0=107(x), r1=181(y), r2=60(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 181
LDI r2, 60
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
