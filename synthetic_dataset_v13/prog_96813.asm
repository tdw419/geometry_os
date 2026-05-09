; DESCRIPTION: Places a purple 51x36 rectangle at position (382, 169).
; PLAN: r0=382(x), r1=169(y), r2=51(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 169
LDI r2, 51
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
