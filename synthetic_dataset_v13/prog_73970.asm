; DESCRIPTION: Places a purple 73x48 rectangle at position (218, 200).
; PLAN: r0=218(x), r1=200(y), r2=73(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 200
LDI r2, 73
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
