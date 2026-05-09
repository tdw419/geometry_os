; DESCRIPTION: Composite: Draws a cyan circle centered at (355, 72) with radius 24 then Draws a orange line from (199, 129) to (371, 180).
; PLAN: r0=355(x), r1=72(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x1), r6=129(y1), r7=371(x2), r8=180(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 72
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 129
LDI r7, 371
LDI r8, 180
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
