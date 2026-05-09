; DESCRIPTION: Renders a yellow box of size 95x58 starting at (102, 186).
; PLAN: r0=102(x), r1=186(y), r2=95(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 186
LDI r2, 95
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
