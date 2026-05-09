; DESCRIPTION: Places a magenta 31x55 rectangle at position (121, 58).
; PLAN: r0=121(x), r1=58(y), r2=31(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 58
LDI r2, 31
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
