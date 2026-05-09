; DESCRIPTION: Places a magenta 43x59 rectangle at position (211, 180).
; PLAN: r0=211(x), r1=180(y), r2=43(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 180
LDI r2, 43
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
