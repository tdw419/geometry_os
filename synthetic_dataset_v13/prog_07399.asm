; DESCRIPTION: Places a purple 73x71 rectangle at position (152, 172).
; PLAN: r0=152(x), r1=172(y), r2=73(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 172
LDI r2, 73
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
