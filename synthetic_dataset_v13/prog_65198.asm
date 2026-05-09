; DESCRIPTION: Places a purple 25x55 rectangle at position (202, 172).
; PLAN: r0=202(x), r1=172(y), r2=25(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 172
LDI r2, 25
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
