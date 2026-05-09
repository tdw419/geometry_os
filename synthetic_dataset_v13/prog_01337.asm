; DESCRIPTION: Places a magenta 47x83 rectangle at position (188, 117).
; PLAN: r0=188(x), r1=117(y), r2=47(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 117
LDI r2, 47
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
