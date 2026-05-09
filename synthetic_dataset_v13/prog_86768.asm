; DESCRIPTION: Places a green 16x75 rectangle at position (35, 1).
; PLAN: r0=35(x), r1=1(y), r2=16(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 1
LDI r2, 16
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
