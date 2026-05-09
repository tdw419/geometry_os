; DESCRIPTION: Renders a black box of size 98x103 starting at (36, 121).
; PLAN: r0=36(x), r1=121(y), r2=98(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 121
LDI r2, 98
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
