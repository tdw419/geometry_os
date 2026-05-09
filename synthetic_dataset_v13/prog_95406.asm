; DESCRIPTION: Renders a yellow box of size 58x77 starting at (148, 143).
; PLAN: r0=148(x), r1=143(y), r2=58(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 143
LDI r2, 58
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
