; DESCRIPTION: Places a purple 44x109 rectangle at position (31, 71).
; PLAN: r0=31(x), r1=71(y), r2=44(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 71
LDI r2, 44
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
