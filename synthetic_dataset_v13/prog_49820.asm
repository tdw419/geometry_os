; DESCRIPTION: Places a magenta 39x77 rectangle at position (314, 55).
; PLAN: r0=314(x), r1=55(y), r2=39(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 55
LDI r2, 39
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
