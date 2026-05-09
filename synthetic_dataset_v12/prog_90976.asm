; DESCRIPTION: Places a purple 83x44 rectangle at position (120, 40).
; PLAN: r0=120(x), r1=40(y), r2=83(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 40
LDI r2, 83
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
