; DESCRIPTION: Places a yellow 60x61 rectangle at position (256, 90).
; PLAN: r0=256(x), r1=90(y), r2=60(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 90
LDI r2, 60
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
