; DESCRIPTION: Places a purple 28x102 rectangle at position (393, 123).
; PLAN: r0=393(x), r1=123(y), r2=28(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 123
LDI r2, 28
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
