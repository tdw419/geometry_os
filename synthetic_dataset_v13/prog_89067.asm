; DESCRIPTION: Places a purple 55x34 rectangle at position (229, 1).
; PLAN: r0=229(x), r1=1(y), r2=55(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 1
LDI r2, 55
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
