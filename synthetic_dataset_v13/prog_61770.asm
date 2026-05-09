; DESCRIPTION: Renders a black box of size 56x62 starting at (437, 160).
; PLAN: r0=437(x), r1=160(y), r2=56(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 160
LDI r2, 56
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
