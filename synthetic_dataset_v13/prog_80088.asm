; DESCRIPTION: Places a purple 49x50 rectangle at position (42, 65).
; PLAN: r0=42(x), r1=65(y), r2=49(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 65
LDI r2, 49
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
