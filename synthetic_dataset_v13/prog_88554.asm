; DESCRIPTION: Composite: Renders a cyan line between points (312, 146) and (402, 23) then Places a yellow dot at position (220, 187).
; PLAN: r0=312(x1), r1=146(y1), r2=402(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=187(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 146
LDI r2, 402
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 187
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
