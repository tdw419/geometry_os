; DESCRIPTION: Places a black 60x15 rectangle at position (320, 11).
; PLAN: r0=320(x), r1=11(y), r2=60(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 11
LDI r2, 60
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
