; DESCRIPTION: Places a purple 46x32 rectangle at position (426, 42).
; PLAN: r0=426(x), r1=42(y), r2=46(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 42
LDI r2, 46
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
