; DESCRIPTION: Places a green 37x10 rectangle at position (180, 49).
; PLAN: r0=180(x), r1=49(y), r2=37(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 49
LDI r2, 37
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
