; DESCRIPTION: Places a orange 25x75 rectangle at position (371, 96).
; PLAN: r0=371(x), r1=96(y), r2=25(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 96
LDI r2, 25
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
