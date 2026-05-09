; DESCRIPTION: Renders a black box of size 98x30 starting at (333, 8).
; PLAN: r0=333(x), r1=8(y), r2=98(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 8
LDI r2, 98
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
