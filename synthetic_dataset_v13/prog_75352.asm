; DESCRIPTION: Composite: Draws a magenta line from (25, 97) to (365, 131) then Renders a cyan disk with center (141, 129) and radius 45.
; PLAN: r0=25(x1), r1=97(y1), r2=365(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=129(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 25
LDI r1, 97
LDI r2, 365
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 129
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
