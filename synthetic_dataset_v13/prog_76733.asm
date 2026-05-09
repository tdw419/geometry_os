; DESCRIPTION: Places a magenta 54x74 rectangle at position (400, 39).
; PLAN: r0=400(x), r1=39(y), r2=54(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 39
LDI r2, 54
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
