; DESCRIPTION: Places a magenta 106x54 rectangle at position (38, 6).
; PLAN: r0=38(x), r1=6(y), r2=106(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 6
LDI r2, 106
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
