; DESCRIPTION: Renders a purple box of size 25x54 starting at (198, 42).
; PLAN: r0=198(x), r1=42(y), r2=25(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 42
LDI r2, 25
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
