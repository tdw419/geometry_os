; DESCRIPTION: Renders a yellow box of size 14x106 starting at (445, 126).
; PLAN: r0=445(x), r1=126(y), r2=14(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 126
LDI r2, 14
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
