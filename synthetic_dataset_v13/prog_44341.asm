; DESCRIPTION: Renders a yellow box of size 108x119 starting at (403, 57).
; PLAN: r0=403(x), r1=57(y), r2=108(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 57
LDI r2, 108
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
