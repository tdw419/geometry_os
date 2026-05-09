; DESCRIPTION: Composite: Places a yellow dot at position (322, 45) then Renders a green box of size 95x64 starting at (89, 38).
; PLAN: r0=322(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=38(y), r7=95(width), r8=64(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 45
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 89
LDI r6, 38
LDI r7, 95
LDI r8, 64
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
