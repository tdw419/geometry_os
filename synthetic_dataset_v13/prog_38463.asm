; DESCRIPTION: Composite: Sets a single black pixel at (197, 165) then Renders a cyan line between points (8, 88) and (242, 88).
; PLAN: r0=197(x), r1=165(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=88(y1), r7=242(x2), r8=88(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 165
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 8
LDI r6, 88
LDI r7, 242
LDI r8, 88
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
