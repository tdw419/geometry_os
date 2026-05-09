; DESCRIPTION: Renders a black box of size 45x87 starting at (230, 46).
; PLAN: r0=230(x), r1=46(y), r2=45(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 46
LDI r2, 45
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
