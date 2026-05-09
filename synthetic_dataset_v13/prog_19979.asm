; DESCRIPTION: Places a blue 60x61 rectangle at position (195, 71).
; PLAN: r0=195(x), r1=71(y), r2=60(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 71
LDI r2, 60
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
