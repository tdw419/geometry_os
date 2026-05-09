; DESCRIPTION: Composite: Renders a magenta disk with center (445, 40) and radius 40 then Draws a green line from (77, 131) to (212, 43).
; PLAN: r0=445(x), r1=40(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x1), r6=131(y1), r7=212(x2), r8=43(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 40
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 131
LDI r7, 212
LDI r8, 43
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
