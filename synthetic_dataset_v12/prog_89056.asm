; DESCRIPTION: Renders a purple box of size 108x116 starting at (150, 5).
; PLAN: r0=150(x), r1=5(y), r2=108(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 5
LDI r2, 108
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
