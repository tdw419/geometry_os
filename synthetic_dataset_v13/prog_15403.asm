; DESCRIPTION: Places a magenta 44x22 rectangle at position (59, 7).
; PLAN: r0=59(x), r1=7(y), r2=44(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 7
LDI r2, 44
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
