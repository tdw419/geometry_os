; DESCRIPTION: Places a black 42x94 rectangle at position (436, 20).
; PLAN: r0=436(x), r1=20(y), r2=42(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 20
LDI r2, 42
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
