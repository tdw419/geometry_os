; DESCRIPTION: Places a magenta 25x30 rectangle at position (202, 77).
; PLAN: r0=202(x), r1=77(y), r2=25(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 77
LDI r2, 25
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
