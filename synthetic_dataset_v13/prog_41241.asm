; DESCRIPTION: Places a black 94x108 rectangle at position (360, 92).
; PLAN: r0=360(x), r1=92(y), r2=94(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 92
LDI r2, 94
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
