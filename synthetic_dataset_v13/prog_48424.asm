; DESCRIPTION: Composite: Renders a magenta line between points (47, 96) and (238, 54) then Places a green dot at position (281, 12).
; PLAN: r0=47(x1), r1=96(y1), r2=238(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=12(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 96
LDI r2, 238
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 12
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
