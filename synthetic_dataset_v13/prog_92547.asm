; DESCRIPTION: Places a purple 76x92 rectangle at position (207, 54).
; PLAN: r0=207(x), r1=54(y), r2=76(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 54
LDI r2, 76
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
