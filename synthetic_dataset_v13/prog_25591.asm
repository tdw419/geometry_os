; DESCRIPTION: Renders a black box of size 25x98 starting at (98, 91).
; PLAN: r0=98(x), r1=91(y), r2=25(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 91
LDI r2, 25
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
