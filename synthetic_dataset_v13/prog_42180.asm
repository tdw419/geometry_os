; DESCRIPTION: Places a purple 22x82 rectangle at position (112, 71).
; PLAN: r0=112(x), r1=71(y), r2=22(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 71
LDI r2, 22
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
