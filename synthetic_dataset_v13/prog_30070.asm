; DESCRIPTION: Renders a purple box of size 10x90 starting at (349, 44).
; PLAN: r0=349(x), r1=44(y), r2=10(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 44
LDI r2, 10
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
