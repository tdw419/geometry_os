; DESCRIPTION: Renders a purple box of size 59x113 starting at (98, 113).
; PLAN: r0=98(x), r1=113(y), r2=59(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 113
LDI r2, 59
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
