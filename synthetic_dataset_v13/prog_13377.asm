; DESCRIPTION: Renders a purple box of size 68x115 starting at (32, 109).
; PLAN: r0=32(x), r1=109(y), r2=68(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 109
LDI r2, 68
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
