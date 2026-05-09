; DESCRIPTION: Places a magenta 35x54 rectangle at position (400, 26).
; PLAN: r0=400(x), r1=26(y), r2=35(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 26
LDI r2, 35
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
