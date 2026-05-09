; DESCRIPTION: Composite: Places a orange dot at position (91, 181) then Renders a blue line between points (21, 212) and (365, 32).
; PLAN: r0=91(x), r1=181(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=212(y1), r7=365(x2), r8=32(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 181
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 21
LDI r6, 212
LDI r7, 365
LDI r8, 32
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
