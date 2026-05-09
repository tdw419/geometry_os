; DESCRIPTION: Composite: Renders a green disk with center (276, 51) and radius 42 then Draws a green line from (306, 83) to (234, 27).
; PLAN: r0=276(x), r1=51(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x1), r6=83(y1), r7=234(x2), r8=27(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 51
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 83
LDI r7, 234
LDI r8, 27
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
