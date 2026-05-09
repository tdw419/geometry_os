; DESCRIPTION: Places a yellow 118x59 rectangle at position (124, 102).
; PLAN: r0=124(x), r1=102(y), r2=118(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 102
LDI r2, 118
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
