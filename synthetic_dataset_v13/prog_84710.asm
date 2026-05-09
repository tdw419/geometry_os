; DESCRIPTION: Places a purple 28x36 rectangle at position (177, 24).
; PLAN: r0=177(x), r1=24(y), r2=28(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 24
LDI r2, 28
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
