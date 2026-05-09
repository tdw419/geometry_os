; DESCRIPTION: Renders a black box of size 98x69 starting at (273, 128).
; PLAN: r0=273(x), r1=128(y), r2=98(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 128
LDI r2, 98
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
