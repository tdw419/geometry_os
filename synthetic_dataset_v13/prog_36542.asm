; DESCRIPTION: Places a green 54x40 rectangle at position (378, 116).
; PLAN: r0=378(x), r1=116(y), r2=54(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 116
LDI r2, 54
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
