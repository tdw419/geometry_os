; DESCRIPTION: Places a purple 95x68 rectangle at position (269, 44).
; PLAN: r0=269(x), r1=44(y), r2=95(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 44
LDI r2, 95
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
