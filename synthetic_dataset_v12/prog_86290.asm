; DESCRIPTION: Renders a yellow box of size 108x15 starting at (217, 90).
; PLAN: r0=217(x), r1=90(y), r2=108(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 90
LDI r2, 108
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
