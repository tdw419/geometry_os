; DESCRIPTION: Renders a yellow box of size 95x31 starting at (71, 214).
; PLAN: r0=71(x), r1=214(y), r2=95(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 214
LDI r2, 95
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
