; DESCRIPTION: Composite: Renders a cyan box of size 98x54 starting at (342, 34) then Sets a single magenta pixel at (389, 115).
; PLAN: r0=342(x), r1=34(y), r2=98(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=115(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 34
LDI r2, 98
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 115
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
