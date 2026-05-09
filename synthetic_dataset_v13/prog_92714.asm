; DESCRIPTION: Renders a purple box of size 96x90 starting at (92, 48).
; PLAN: r0=92(x), r1=48(y), r2=96(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 48
LDI r2, 96
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
