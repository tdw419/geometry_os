; DESCRIPTION: Places a blue 33x42 rectangle at position (441, 90).
; PLAN: r0=441(x), r1=90(y), r2=33(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 90
LDI r2, 33
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
