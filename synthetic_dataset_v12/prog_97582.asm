; DESCRIPTION: Places a purple 54x53 rectangle at position (415, 175).
; PLAN: r0=415(x), r1=175(y), r2=54(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 175
LDI r2, 54
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
