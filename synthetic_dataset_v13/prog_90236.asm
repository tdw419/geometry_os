; DESCRIPTION: Composite: Renders a blue line between points (450, 242) and (42, 2) then Places a cyan dot at position (208, 21).
; PLAN: r0=450(x1), r1=242(y1), r2=42(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=21(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 450
LDI r1, 242
LDI r2, 42
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 21
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
