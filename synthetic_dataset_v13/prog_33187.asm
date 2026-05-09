; DESCRIPTION: Places a magenta 46x34 rectangle at position (408, 59).
; PLAN: r0=408(x), r1=59(y), r2=46(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 59
LDI r2, 46
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
