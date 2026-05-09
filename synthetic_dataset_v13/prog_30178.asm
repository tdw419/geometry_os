; DESCRIPTION: Renders a red box of size 48x51 starting at (462, 169).
; PLAN: r0=462(x), r1=169(y), r2=48(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 169
LDI r2, 48
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
