; DESCRIPTION: Places a green 85x16 rectangle at position (160, 93).
; PLAN: r0=160(x), r1=93(y), r2=85(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 93
LDI r2, 85
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
