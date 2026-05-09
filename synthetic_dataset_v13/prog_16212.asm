; DESCRIPTION: Renders a blue box of size 48x36 starting at (121, 169).
; PLAN: r0=121(x), r1=169(y), r2=48(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 169
LDI r2, 48
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
