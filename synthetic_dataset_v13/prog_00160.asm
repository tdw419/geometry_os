; DESCRIPTION: Places a purple 47x48 rectangle at position (411, 200).
; PLAN: r0=411(x), r1=200(y), r2=47(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 200
LDI r2, 47
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
