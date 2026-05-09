; DESCRIPTION: Places a green 87x22 rectangle at position (305, 93).
; PLAN: r0=305(x), r1=93(y), r2=87(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 93
LDI r2, 87
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
