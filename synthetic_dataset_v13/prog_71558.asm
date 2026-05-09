; DESCRIPTION: Places a purple 13x20 rectangle at position (400, 182).
; PLAN: r0=400(x), r1=182(y), r2=13(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 182
LDI r2, 13
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
