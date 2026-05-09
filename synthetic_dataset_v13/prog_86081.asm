; DESCRIPTION: Renders a black box of size 54x98 starting at (55, 61).
; PLAN: r0=55(x), r1=61(y), r2=54(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 61
LDI r2, 54
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
