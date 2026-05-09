; DESCRIPTION: Places a purple 24x17 rectangle at position (415, 99).
; PLAN: r0=415(x), r1=99(y), r2=24(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 99
LDI r2, 24
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
