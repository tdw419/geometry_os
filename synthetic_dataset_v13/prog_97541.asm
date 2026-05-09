; DESCRIPTION: Composite: Places a yellow dot at position (333, 173) then Renders a blue line between points (252, 248) and (103, 158).
; PLAN: r0=333(x), r1=173(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=252(x1), r6=248(y1), r7=103(x2), r8=158(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 173
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 252
LDI r6, 248
LDI r7, 103
LDI r8, 158
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
