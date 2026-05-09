; DESCRIPTION: Places a purple 94x55 rectangle at position (112, 117).
; PLAN: r0=112(x), r1=117(y), r2=94(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 117
LDI r2, 94
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
