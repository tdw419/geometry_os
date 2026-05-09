; DESCRIPTION: Places a green 26x57 rectangle at position (180, 13).
; PLAN: r0=180(x), r1=13(y), r2=26(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 13
LDI r2, 26
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
