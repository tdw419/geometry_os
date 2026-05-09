; DESCRIPTION: Composite: Draws a green circle centered at (138, 168) with radius 34 then Sets a single red pixel at (187, 117).
; PLAN: r0=138(x), r1=168(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=117(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 168
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 117
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
