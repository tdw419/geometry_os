; DESCRIPTION: Renders a yellow box of size 37x76 starting at (174, 18).
; PLAN: r0=174(x), r1=18(y), r2=37(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 18
LDI r2, 37
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
