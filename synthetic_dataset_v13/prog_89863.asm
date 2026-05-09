; DESCRIPTION: Renders a yellow box of size 65x57 starting at (397, 38).
; PLAN: r0=397(x), r1=38(y), r2=65(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 38
LDI r2, 65
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
