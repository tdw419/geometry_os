; DESCRIPTION: Composite: Places a cyan circle of radius 58 at center (78, 198) then Renders a orange line between points (487, 173) and (363, 179).
; PLAN: r0=78(x), r1=198(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=173(y1), r7=363(x2), r8=179(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 198
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 173
LDI r7, 363
LDI r8, 179
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
