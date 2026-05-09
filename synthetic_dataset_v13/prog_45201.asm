; DESCRIPTION: Renders a black box of size 78x78 starting at (398, 19).
; PLAN: r0=398(x), r1=19(y), r2=78(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 19
LDI r2, 78
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
