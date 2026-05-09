; DESCRIPTION: Places a magenta 44x80 rectangle at position (338, 104).
; PLAN: r0=338(x), r1=104(y), r2=44(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 104
LDI r2, 44
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
