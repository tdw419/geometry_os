; DESCRIPTION: Places a purple 39x42 rectangle at position (94, 55).
; PLAN: r0=94(x), r1=55(y), r2=39(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 55
LDI r2, 39
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
