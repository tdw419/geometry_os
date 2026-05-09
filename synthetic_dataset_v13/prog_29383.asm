; DESCRIPTION: Renders a black box of size 36x99 starting at (436, 14).
; PLAN: r0=436(x), r1=14(y), r2=36(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 14
LDI r2, 36
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
