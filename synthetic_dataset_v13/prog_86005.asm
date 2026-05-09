; DESCRIPTION: Places a purple 38x53 rectangle at position (207, 152).
; PLAN: r0=207(x), r1=152(y), r2=38(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 152
LDI r2, 38
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
