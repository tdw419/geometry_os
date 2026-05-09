; DESCRIPTION: Places a magenta 70x55 rectangle at position (38, 127).
; PLAN: r0=38(x), r1=127(y), r2=70(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 127
LDI r2, 70
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
