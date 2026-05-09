; DESCRIPTION: Renders a yellow box of size 102x120 starting at (44, 92).
; PLAN: r0=44(x), r1=92(y), r2=102(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 92
LDI r2, 102
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
