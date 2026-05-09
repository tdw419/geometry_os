; DESCRIPTION: Places a purple 38x95 rectangle at position (437, 31).
; PLAN: r0=437(x), r1=31(y), r2=38(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 31
LDI r2, 38
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
