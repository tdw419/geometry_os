; DESCRIPTION: Places a black 35x65 rectangle at position (464, 170).
; PLAN: r0=464(x), r1=170(y), r2=35(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 170
LDI r2, 35
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
