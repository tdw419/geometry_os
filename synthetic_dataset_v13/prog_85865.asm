; DESCRIPTION: Places a purple 47x104 rectangle at position (294, 141).
; PLAN: r0=294(x), r1=141(y), r2=47(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 141
LDI r2, 47
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
