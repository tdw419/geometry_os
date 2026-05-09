; DESCRIPTION: Renders a purple box of size 24x48 starting at (14, 169).
; PLAN: r0=14(x), r1=169(y), r2=24(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 169
LDI r2, 24
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
