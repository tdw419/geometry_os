; DESCRIPTION: Composite: Sets a single purple pixel at (130, 144) then Renders a cyan line between points (452, 223) and (421, 103).
; PLAN: r0=130(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=452(x1), r6=223(y1), r7=421(x2), r8=103(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 223
LDI r7, 421
LDI r8, 103
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
