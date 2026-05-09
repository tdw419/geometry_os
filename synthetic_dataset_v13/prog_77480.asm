; DESCRIPTION: Composite: Sets a single black pixel at (131, 127) then Renders a yellow box of size 120x31 starting at (72, 56).
; PLAN: r0=131(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=56(y), r7=120(width), r8=31(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 72
LDI r6, 56
LDI r7, 120
LDI r8, 31
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
