; DESCRIPTION: Composite: Renders a red box of size 65x103 starting at (124, 102) then Sets a single red pixel at (4, 68).
; PLAN: r0=124(x), r1=102(y), r2=65(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x), r6=68(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 124
LDI r1, 102
LDI r2, 65
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 68
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
