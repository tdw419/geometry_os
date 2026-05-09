; DESCRIPTION: Renders a yellow box of size 117x95 starting at (303, 108).
; PLAN: r0=303(x), r1=108(y), r2=117(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 108
LDI r2, 117
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
