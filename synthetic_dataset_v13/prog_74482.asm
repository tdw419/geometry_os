; DESCRIPTION: Places a magenta 34x44 rectangle at position (400, 81).
; PLAN: r0=400(x), r1=81(y), r2=34(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 81
LDI r2, 34
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
