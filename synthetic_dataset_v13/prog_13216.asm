; DESCRIPTION: Places a purple 113x38 rectangle at position (350, 124).
; PLAN: r0=350(x), r1=124(y), r2=113(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 124
LDI r2, 113
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
