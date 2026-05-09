; DESCRIPTION: Places a blue 42x39 rectangle at position (378, 120).
; PLAN: r0=378(x), r1=120(y), r2=42(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 120
LDI r2, 42
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
