; DESCRIPTION: Renders a purple box of size 103x28 starting at (387, 120).
; PLAN: r0=387(x), r1=120(y), r2=103(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 120
LDI r2, 103
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
