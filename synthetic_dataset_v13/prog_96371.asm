; DESCRIPTION: Places a purple 40x100 rectangle at position (82, 71).
; PLAN: r0=82(x), r1=71(y), r2=40(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 71
LDI r2, 40
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
