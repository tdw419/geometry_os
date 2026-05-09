; DESCRIPTION: Composite: Renders a magenta line between points (92, 218) and (283, 28) then Places a orange dot at position (16, 84).
; PLAN: r0=92(x1), r1=218(y1), r2=283(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=84(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 218
LDI r2, 283
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 84
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
