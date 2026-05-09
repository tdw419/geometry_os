; DESCRIPTION: Places a magenta 83x12 rectangle at position (89, 221).
; PLAN: r0=89(x), r1=221(y), r2=83(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 221
LDI r2, 83
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
