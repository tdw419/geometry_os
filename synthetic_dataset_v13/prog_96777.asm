; DESCRIPTION: Renders a purple box of size 112x12 starting at (42, 113).
; PLAN: r0=42(x), r1=113(y), r2=112(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 113
LDI r2, 112
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
