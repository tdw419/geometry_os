; DESCRIPTION: Places a blue 107x74 rectangle at position (320, 3).
; PLAN: r0=320(x), r1=3(y), r2=107(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 3
LDI r2, 107
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
