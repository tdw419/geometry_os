; DESCRIPTION: Places a purple 70x87 rectangle at position (415, 87).
; PLAN: r0=415(x), r1=87(y), r2=70(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 87
LDI r2, 70
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
