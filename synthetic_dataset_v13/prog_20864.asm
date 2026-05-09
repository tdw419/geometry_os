; DESCRIPTION: Places a blue 80x39 rectangle at position (80, 139).
; PLAN: r0=80(x), r1=139(y), r2=80(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 139
LDI r2, 80
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
