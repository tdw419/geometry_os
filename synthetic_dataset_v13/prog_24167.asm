; DESCRIPTION: Places a purple 70x42 rectangle at position (412, 132).
; PLAN: r0=412(x), r1=132(y), r2=70(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 132
LDI r2, 70
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
