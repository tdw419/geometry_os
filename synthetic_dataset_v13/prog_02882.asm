; DESCRIPTION: Composite: Renders a yellow box of size 14x21 starting at (158, 161) then Sets a single red pixel at (474, 24).
; PLAN: r0=158(x), r1=161(y), r2=14(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=24(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 161
LDI r2, 14
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 24
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
