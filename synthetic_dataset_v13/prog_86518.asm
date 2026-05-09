; DESCRIPTION: Places a black 61x99 rectangle at position (360, 43).
; PLAN: r0=360(x), r1=43(y), r2=61(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 43
LDI r2, 61
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
