; DESCRIPTION: Places a cyan 105x87 rectangle at position (320, 94).
; PLAN: r0=320(x), r1=94(y), r2=105(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 94
LDI r2, 105
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
