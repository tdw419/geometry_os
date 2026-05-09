; DESCRIPTION: Places a purple 42x113 rectangle at position (216, 101).
; PLAN: r0=216(x), r1=101(y), r2=42(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 101
LDI r2, 42
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
