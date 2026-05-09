; DESCRIPTION: Composite: Places a orange dot at position (34, 48) then Renders a black line between points (42, 209) and (470, 142).
; PLAN: r0=34(x), r1=48(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=209(y1), r7=470(x2), r8=142(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 48
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 42
LDI r6, 209
LDI r7, 470
LDI r8, 142
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
