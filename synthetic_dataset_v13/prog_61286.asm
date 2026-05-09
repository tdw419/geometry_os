; DESCRIPTION: Composite: Renders a red box of size 41x117 starting at (423, 112) then Sets a single black pixel at (218, 177).
; PLAN: r0=423(x), r1=112(y), r2=41(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=177(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 112
LDI r2, 41
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 177
LDI r7, 0x000000
PSET r5, r6, r7
HALT
