; DESCRIPTION: Places a purple 85x48 rectangle at position (286, 58).
; PLAN: r0=286(x), r1=58(y), r2=85(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 58
LDI r2, 85
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
