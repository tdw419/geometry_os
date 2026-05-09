; DESCRIPTION: Places a blue 14x26 rectangle at position (193, 91).
; PLAN: r0=193(x), r1=91(y), r2=14(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 91
LDI r2, 14
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
