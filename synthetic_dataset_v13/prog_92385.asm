; DESCRIPTION: Renders a purple box of size 28x103 starting at (113, 144).
; PLAN: r0=113(x), r1=144(y), r2=28(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 144
LDI r2, 28
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
