; DESCRIPTION: Places a purple 42x30 rectangle at position (44, 65).
; PLAN: r0=44(x), r1=65(y), r2=42(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 65
LDI r2, 42
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
