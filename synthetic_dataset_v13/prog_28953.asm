; DESCRIPTION: Places a green 59x85 rectangle at position (69, 94).
; PLAN: r0=69(x), r1=94(y), r2=59(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 94
LDI r2, 59
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
