; DESCRIPTION: Renders a green box of size 92x95 starting at (145, 157).
; PLAN: r0=145(x), r1=157(y), r2=92(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 157
LDI r2, 92
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
