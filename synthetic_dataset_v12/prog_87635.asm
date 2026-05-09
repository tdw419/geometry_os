; DESCRIPTION: Renders a purple box of size 27x57 starting at (74, 32).
; PLAN: r0=74(x), r1=32(y), r2=27(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 32
LDI r2, 27
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
