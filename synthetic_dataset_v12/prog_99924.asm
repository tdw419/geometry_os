; DESCRIPTION: Composite: Creates a purple circular shape at (98, 82) with radius 42 then Renders a green line between points (461, 145) and (21, 125).
; PLAN: r0=98(x), r1=82(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x1), r6=145(y1), r7=21(x2), r8=125(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 82
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 145
LDI r7, 21
LDI r8, 125
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
