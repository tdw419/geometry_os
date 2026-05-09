; DESCRIPTION: Places a purple 55x71 rectangle at position (44, 96).
; PLAN: r0=44(x), r1=96(y), r2=55(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 96
LDI r2, 55
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
