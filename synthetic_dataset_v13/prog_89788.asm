; DESCRIPTION: Places a black 30x80 rectangle at position (320, 87).
; PLAN: r0=320(x), r1=87(y), r2=30(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 87
LDI r2, 30
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
