; DESCRIPTION: Places a purple 42x90 rectangle at position (154, 110).
; PLAN: r0=154(x), r1=110(y), r2=42(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 110
LDI r2, 42
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
