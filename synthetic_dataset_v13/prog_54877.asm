; DESCRIPTION: Places a purple 22x71 rectangle at position (220, 82).
; PLAN: r0=220(x), r1=82(y), r2=22(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 82
LDI r2, 22
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
