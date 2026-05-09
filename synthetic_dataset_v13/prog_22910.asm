; DESCRIPTION: Composite: Creates a blue circular shape at (262, 140) with radius 18 then Draws a cyan line from (57, 119) to (206, 68).
; PLAN: r0=262(x), r1=140(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x1), r6=119(y1), r7=206(x2), r8=68(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 140
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 119
LDI r7, 206
LDI r8, 68
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
