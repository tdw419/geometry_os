; DESCRIPTION: Renders a purple box of size 93x67 starting at (392, 82).
; PLAN: r0=392(x), r1=82(y), r2=93(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 82
LDI r2, 93
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
