; DESCRIPTION: Places a purple 85x42 rectangle at position (63, 165).
; PLAN: r0=63(x), r1=165(y), r2=85(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 165
LDI r2, 85
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
