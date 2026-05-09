; DESCRIPTION: Places a green 95x13 rectangle at position (68, 26).
; PLAN: r0=68(x), r1=26(y), r2=95(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 26
LDI r2, 95
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
