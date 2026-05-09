; DESCRIPTION: Composite: Places a red dot at position (66, 58) then Places a yellow circle of radius 49 at center (308, 182).
; PLAN: r0=66(x), r1=58(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=182(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 66
LDI r1, 58
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 308
LDI r6, 182
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
