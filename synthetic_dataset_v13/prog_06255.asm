; DESCRIPTION: Renders a black box of size 113x29 starting at (355, 198).
; PLAN: r0=355(x), r1=198(y), r2=113(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 198
LDI r2, 113
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
