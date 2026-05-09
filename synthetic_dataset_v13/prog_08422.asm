; DESCRIPTION: Places a blue 38x105 rectangle at position (368, 104).
; PLAN: r0=368(x), r1=104(y), r2=38(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 104
LDI r2, 38
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
