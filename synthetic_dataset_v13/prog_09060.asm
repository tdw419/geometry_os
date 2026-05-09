; DESCRIPTION: Places a magenta 12x78 rectangle at position (313, 91).
; PLAN: r0=313(x), r1=91(y), r2=12(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 91
LDI r2, 12
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
