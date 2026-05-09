; DESCRIPTION: Places a magenta 30x34 rectangle at position (481, 44).
; PLAN: r0=481(x), r1=44(y), r2=30(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 44
LDI r2, 30
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
