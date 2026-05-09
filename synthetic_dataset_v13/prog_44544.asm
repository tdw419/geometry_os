; DESCRIPTION: Places a green 109x22 rectangle at position (57, 26).
; PLAN: r0=57(x), r1=26(y), r2=109(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 26
LDI r2, 109
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
