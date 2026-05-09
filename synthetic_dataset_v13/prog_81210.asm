; DESCRIPTION: Renders a purple box of size 46x10 starting at (300, 82).
; PLAN: r0=300(x), r1=82(y), r2=46(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 82
LDI r2, 46
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
