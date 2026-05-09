; DESCRIPTION: Places a magenta 104x105 rectangle at position (369, 149).
; PLAN: r0=369(x), r1=149(y), r2=104(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 149
LDI r2, 104
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
