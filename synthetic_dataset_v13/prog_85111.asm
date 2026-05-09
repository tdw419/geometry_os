; DESCRIPTION: Places a green 50x16 rectangle at position (87, 105).
; PLAN: r0=87(x), r1=105(y), r2=50(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 105
LDI r2, 50
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
