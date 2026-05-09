; DESCRIPTION: Renders a black box of size 113x43 starting at (335, 21).
; PLAN: r0=335(x), r1=21(y), r2=113(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 21
LDI r2, 113
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
