; DESCRIPTION: Renders a purple box of size 59x70 starting at (346, 79).
; PLAN: r0=346(x), r1=79(y), r2=59(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 79
LDI r2, 59
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
