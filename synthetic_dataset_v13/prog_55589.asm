; DESCRIPTION: Composite: Sets a single orange pixel at (411, 119) then Renders a yellow box of size 10x112 starting at (326, 34).
; PLAN: r0=411(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=34(y), r7=10(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 119
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 326
LDI r6, 34
LDI r7, 10
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
