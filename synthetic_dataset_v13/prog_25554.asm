; DESCRIPTION: Renders a yellow box of size 102x98 starting at (174, 142).
; PLAN: r0=174(x), r1=142(y), r2=102(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 142
LDI r2, 102
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
