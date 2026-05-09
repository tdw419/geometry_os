; DESCRIPTION: Composite: Creates a green circular shape at (256, 162) with radius 17 then Draws a magenta line from (292, 215) to (342, 223).
; PLAN: r0=256(x), r1=162(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x1), r6=215(y1), r7=342(x2), r8=223(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 162
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 215
LDI r7, 342
LDI r8, 223
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
