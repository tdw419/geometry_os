; DESCRIPTION: Places a purple 33x82 rectangle at position (225, 24).
; PLAN: r0=225(x), r1=24(y), r2=33(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 24
LDI r2, 33
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
