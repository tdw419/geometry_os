; DESCRIPTION: Places a purple 15x28 rectangle at position (400, 165).
; PLAN: r0=400(x), r1=165(y), r2=15(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 165
LDI r2, 15
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
