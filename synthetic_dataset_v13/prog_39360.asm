; DESCRIPTION: Places a blue 18x14 rectangle at position (470, 139).
; PLAN: r0=470(x), r1=139(y), r2=18(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 139
LDI r2, 18
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
