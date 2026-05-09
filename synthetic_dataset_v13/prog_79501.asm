; DESCRIPTION: Renders a green box of size 57x92 starting at (86, 65).
; PLAN: r0=86(x), r1=65(y), r2=57(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 65
LDI r2, 57
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
