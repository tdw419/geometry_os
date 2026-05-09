; DESCRIPTION: Renders a blue box of size 73x94 starting at (346, 82).
; PLAN: r0=346(x), r1=82(y), r2=73(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 82
LDI r2, 73
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
