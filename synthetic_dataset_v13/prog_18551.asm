; DESCRIPTION: Renders a black box of size 117x62 starting at (108, 120).
; PLAN: r0=108(x), r1=120(y), r2=117(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 120
LDI r2, 117
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
