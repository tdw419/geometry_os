; DESCRIPTION: Composite: Places a cyan circle of radius 58 at center (149, 116) then Renders a cyan line between points (434, 109) and (408, 100).
; PLAN: r0=149(x), r1=116(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x1), r6=109(y1), r7=408(x2), r8=100(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 116
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 109
LDI r7, 408
LDI r8, 100
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
