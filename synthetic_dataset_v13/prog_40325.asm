; DESCRIPTION: Places a green 78x98 rectangle at position (126, 85).
; PLAN: r0=126(x), r1=85(y), r2=78(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 85
LDI r2, 78
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
