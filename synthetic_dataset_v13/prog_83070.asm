; DESCRIPTION: Composite: Places a white circle of radius 22 at center (95, 212) then Renders a magenta line between points (68, 82) and (502, 41).
; PLAN: r0=95(x), r1=212(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x1), r6=82(y1), r7=502(x2), r8=41(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 212
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 82
LDI r7, 502
LDI r8, 41
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
