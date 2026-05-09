; DESCRIPTION: Composite: Draws a cyan line from (4, 12) to (89, 42) then Draws a green circle centered at (103, 142) with radius 74.
; PLAN: r0=4(x1), r1=12(y1), r2=89(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=142(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 4
LDI r1, 12
LDI r2, 89
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 142
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
