; DESCRIPTION: Places a purple 24x102 rectangle at position (423, 6).
; PLAN: r0=423(x), r1=6(y), r2=24(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 6
LDI r2, 24
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
