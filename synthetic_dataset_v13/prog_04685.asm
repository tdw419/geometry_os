; DESCRIPTION: Renders a yellow box of size 58x46 starting at (437, 166).
; PLAN: r0=437(x), r1=166(y), r2=58(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 166
LDI r2, 58
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
