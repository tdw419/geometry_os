; DESCRIPTION: Places a black 25x55 rectangle at position (65, 30).
; PLAN: r0=65(x), r1=30(y), r2=25(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 30
LDI r2, 25
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
