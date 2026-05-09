; DESCRIPTION: Places a blue 85x77 rectangle at position (320, 87).
; PLAN: r0=320(x), r1=87(y), r2=85(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 87
LDI r2, 85
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
