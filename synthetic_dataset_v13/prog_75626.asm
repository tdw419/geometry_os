; DESCRIPTION: Composite: Places a orange dot at position (446, 11) then Creates a red circular shape at (262, 59) with radius 14.
; PLAN: r0=446(x), r1=11(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=59(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 446
LDI r1, 11
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 262
LDI r6, 59
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
