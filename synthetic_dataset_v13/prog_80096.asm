; DESCRIPTION: Renders a purple box of size 94x115 starting at (328, 73).
; PLAN: r0=328(x), r1=73(y), r2=94(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 73
LDI r2, 94
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
