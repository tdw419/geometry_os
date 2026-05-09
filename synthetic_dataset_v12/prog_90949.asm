; DESCRIPTION: Renders a yellow box of size 62x47 starting at (330, 117).
; PLAN: r0=330(x), r1=117(y), r2=62(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 117
LDI r2, 62
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
