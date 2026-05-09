; DESCRIPTION: Places a magenta 119x104 rectangle at position (81, 33).
; PLAN: r0=81(x), r1=33(y), r2=119(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 33
LDI r2, 119
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
