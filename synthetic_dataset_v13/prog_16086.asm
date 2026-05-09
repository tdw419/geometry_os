; DESCRIPTION: Places a magenta 38x100 rectangle at position (135, 89).
; PLAN: r0=135(x), r1=89(y), r2=38(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 89
LDI r2, 38
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
