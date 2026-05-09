; DESCRIPTION: Composite: Creates a magenta circular shape at (198, 65) with radius 24 then Renders a cyan line between points (273, 1) and (74, 80).
; PLAN: r0=198(x), r1=65(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x1), r6=1(y1), r7=74(x2), r8=80(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 65
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 1
LDI r7, 74
LDI r8, 80
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
