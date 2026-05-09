; DESCRIPTION: Places a magenta 99x62 rectangle at position (180, 108).
; PLAN: r0=180(x), r1=108(y), r2=99(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 108
LDI r2, 99
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
