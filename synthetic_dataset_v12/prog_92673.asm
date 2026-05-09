; DESCRIPTION: Places a magenta 78x80 rectangle at position (313, 138).
; PLAN: r0=313(x), r1=138(y), r2=78(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 138
LDI r2, 78
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
