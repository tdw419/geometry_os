; DESCRIPTION: Places a purple 113x43 rectangle at position (186, 72).
; PLAN: r0=186(x), r1=72(y), r2=113(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 72
LDI r2, 113
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
