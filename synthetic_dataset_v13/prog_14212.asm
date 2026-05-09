; DESCRIPTION: Composite: Places a cyan line segment connecting (511, 5) to (228, 154) then Places a cyan dot at position (339, 101).
; PLAN: r0=511(x1), r1=5(y1), r2=228(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=101(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 511
LDI r1, 5
LDI r2, 228
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 101
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
