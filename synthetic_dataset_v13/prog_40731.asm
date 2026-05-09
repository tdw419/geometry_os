; DESCRIPTION: Composite: Creates a yellow circular shape at (168, 180) with radius 66 then Draws a magenta line from (8, 215) to (435, 36).
; PLAN: r0=168(x), r1=180(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x1), r6=215(y1), r7=435(x2), r8=36(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 180
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 215
LDI r7, 435
LDI r8, 36
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
