; DESCRIPTION: Renders a yellow box of size 11x17 starting at (272, 146).
; PLAN: r0=272(x), r1=146(y), r2=11(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 146
LDI r2, 11
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
