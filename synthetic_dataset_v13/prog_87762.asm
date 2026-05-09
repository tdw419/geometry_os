; DESCRIPTION: Places a red 80x44 rectangle at position (216, 62).
; PLAN: r0=216(x), r1=62(y), r2=80(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 62
LDI r2, 80
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
