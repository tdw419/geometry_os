; DESCRIPTION: Places a blue 36x102 rectangle at position (468, 106).
; PLAN: r0=468(x), r1=106(y), r2=36(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 106
LDI r2, 36
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
