; DESCRIPTION: Places a purple 42x87 rectangle at position (174, 0).
; PLAN: r0=174(x), r1=0(y), r2=42(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 0
LDI r2, 42
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
