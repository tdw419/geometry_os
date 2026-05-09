; DESCRIPTION: Places a magenta 20x25 rectangle at position (368, 104).
; PLAN: r0=368(x), r1=104(y), r2=20(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 104
LDI r2, 20
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
