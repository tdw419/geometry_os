; DESCRIPTION: Places a blue 21x17 rectangle at position (395, 93).
; PLAN: r0=395(x), r1=93(y), r2=21(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 93
LDI r2, 21
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
