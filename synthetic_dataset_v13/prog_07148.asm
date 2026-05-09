; DESCRIPTION: Composite: Creates a red circular shape at (146, 186) with radius 32 then Draws a green line from (132, 5) to (471, 72).
; PLAN: r0=146(x), r1=186(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=5(y1), r7=471(x2), r8=72(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 186
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 5
LDI r7, 471
LDI r8, 72
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
