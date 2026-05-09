; DESCRIPTION: Composite: Places a orange circle of radius 66 at center (204, 133) then Places a cyan line segment connecting (265, 76) to (295, 133).
; PLAN: r0=204(x), r1=133(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x1), r6=76(y1), r7=295(x2), r8=133(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 133
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 76
LDI r7, 295
LDI r8, 133
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
