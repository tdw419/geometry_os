; DESCRIPTION: Places a purple 72x19 rectangle at position (174, 185).
; PLAN: r0=174(x), r1=185(y), r2=72(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 185
LDI r2, 72
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
