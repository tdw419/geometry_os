; DESCRIPTION: Renders a black box of size 72x75 starting at (88, 146).
; PLAN: r0=88(x), r1=146(y), r2=72(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 146
LDI r2, 72
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
