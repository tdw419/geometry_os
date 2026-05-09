; DESCRIPTION: Renders a purple box of size 92x16 starting at (90, 198).
; PLAN: r0=90(x), r1=198(y), r2=92(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 198
LDI r2, 92
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
