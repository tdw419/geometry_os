; DESCRIPTION: Composite: Renders a cyan disk with center (82, 181) and radius 42 then Places a red line segment connecting (81, 70) to (282, 61).
; PLAN: r0=82(x), r1=181(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=70(y1), r7=282(x2), r8=61(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 181
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 70
LDI r7, 282
LDI r8, 61
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
