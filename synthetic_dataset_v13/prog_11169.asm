; DESCRIPTION: Places a magenta 92x46 rectangle at position (98, 100).
; PLAN: r0=98(x), r1=100(y), r2=92(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 100
LDI r2, 92
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
