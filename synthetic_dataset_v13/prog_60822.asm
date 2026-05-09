; DESCRIPTION: Renders a yellow box of size 111x87 starting at (17, 143).
; PLAN: r0=17(x), r1=143(y), r2=111(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 143
LDI r2, 111
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
