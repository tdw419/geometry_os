; DESCRIPTION: Composite: Places a white circle of radius 76 at center (300, 154) then Renders a cyan line between points (468, 183) and (103, 112).
; PLAN: r0=300(x), r1=154(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x1), r6=183(y1), r7=103(x2), r8=112(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 154
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 183
LDI r7, 103
LDI r8, 112
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
