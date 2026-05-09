; DESCRIPTION: Renders a yellow box of size 94x17 starting at (186, 212).
; PLAN: r0=186(x), r1=212(y), r2=94(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 212
LDI r2, 94
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
