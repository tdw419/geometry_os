; DESCRIPTION: Composite: Places a white circle of radius 41 at center (121, 42) then Renders a yellow line between points (215, 238) and (105, 176).
; PLAN: r0=121(x), r1=42(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x1), r6=238(y1), r7=105(x2), r8=176(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 42
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 238
LDI r7, 105
LDI r8, 176
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
