; DESCRIPTION: Places a purple 72x80 rectangle at position (265, 57).
; PLAN: r0=265(x), r1=57(y), r2=72(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 57
LDI r2, 72
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
