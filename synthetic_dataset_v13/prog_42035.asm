; DESCRIPTION: Places a yellow 100x59 rectangle at position (342, 127).
; PLAN: r0=342(x), r1=127(y), r2=100(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 127
LDI r2, 100
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
