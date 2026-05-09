; DESCRIPTION: Places a magenta 104x62 rectangle at position (48, 141).
; PLAN: r0=48(x), r1=141(y), r2=104(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 141
LDI r2, 104
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
