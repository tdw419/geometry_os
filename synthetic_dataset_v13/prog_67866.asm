; DESCRIPTION: Places a purple 42x65 rectangle at position (320, 157).
; PLAN: r0=320(x), r1=157(y), r2=42(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 157
LDI r2, 42
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
