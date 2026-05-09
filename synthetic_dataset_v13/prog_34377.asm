; DESCRIPTION: Places a magenta 44x59 rectangle at position (301, 40).
; PLAN: r0=301(x), r1=40(y), r2=44(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 40
LDI r2, 44
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
