; DESCRIPTION: Renders a green box of size 15x36 starting at (92, 134).
; PLAN: r0=92(x), r1=134(y), r2=15(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 134
LDI r2, 15
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
