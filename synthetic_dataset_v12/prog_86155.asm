; DESCRIPTION: Places a purple 38x109 rectangle at position (457, 75).
; PLAN: r0=457(x), r1=75(y), r2=38(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 75
LDI r2, 38
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
