; DESCRIPTION: Renders a yellow box of size 71x44 starting at (122, 174).
; PLAN: r0=122(x), r1=174(y), r2=71(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 174
LDI r2, 71
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
