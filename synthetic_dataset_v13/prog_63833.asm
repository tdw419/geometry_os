; DESCRIPTION: Composite: Places a white dot at position (91, 10) then Renders a red line between points (242, 234) and (101, 236).
; PLAN: r0=91(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=234(y1), r7=101(x2), r8=236(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 234
LDI r7, 101
LDI r8, 236
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
