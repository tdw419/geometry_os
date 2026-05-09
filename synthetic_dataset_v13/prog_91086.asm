; DESCRIPTION: Renders a yellow box of size 43x86 starting at (303, 33).
; PLAN: r0=303(x), r1=33(y), r2=43(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 33
LDI r2, 43
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
