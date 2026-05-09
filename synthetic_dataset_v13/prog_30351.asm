; DESCRIPTION: Places a magenta 80x115 rectangle at position (424, 28).
; PLAN: r0=424(x), r1=28(y), r2=80(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 28
LDI r2, 80
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
