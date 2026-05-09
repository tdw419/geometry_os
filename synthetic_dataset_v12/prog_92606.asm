; DESCRIPTION: Places a blue 28x73 rectangle at position (71, 63).
; PLAN: r0=71(x), r1=63(y), r2=28(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 63
LDI r2, 28
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
