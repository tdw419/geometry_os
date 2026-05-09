; DESCRIPTION: Renders a purple box of size 36x16 starting at (175, 64).
; PLAN: r0=175(x), r1=64(y), r2=36(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 64
LDI r2, 36
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
