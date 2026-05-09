; DESCRIPTION: Places a magenta 57x108 rectangle at position (146, 85).
; PLAN: r0=146(x), r1=85(y), r2=57(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 85
LDI r2, 57
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
