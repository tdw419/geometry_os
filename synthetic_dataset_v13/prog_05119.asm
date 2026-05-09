; DESCRIPTION: Places a purple 54x116 rectangle at position (345, 83).
; PLAN: r0=345(x), r1=83(y), r2=54(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 83
LDI r2, 54
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
