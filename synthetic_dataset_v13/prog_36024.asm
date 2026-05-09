; DESCRIPTION: Composite: Places a green dot at position (79, 172) then Renders a orange line between points (242, 243) and (138, 157).
; PLAN: r0=79(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=243(y1), r7=138(x2), r8=157(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 172
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 242
LDI r6, 243
LDI r7, 138
LDI r8, 157
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
