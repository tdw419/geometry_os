; DESCRIPTION: Places a purple 42x57 rectangle at position (400, 95).
; PLAN: r0=400(x), r1=95(y), r2=42(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 95
LDI r2, 42
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
