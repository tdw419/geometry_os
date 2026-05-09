; DESCRIPTION: Renders a yellow box of size 108x65 starting at (249, 33).
; PLAN: r0=249(x), r1=33(y), r2=108(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 33
LDI r2, 108
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
