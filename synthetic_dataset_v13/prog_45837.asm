; DESCRIPTION: Places a purple 82x113 rectangle at position (382, 38).
; PLAN: r0=382(x), r1=38(y), r2=82(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 38
LDI r2, 82
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
