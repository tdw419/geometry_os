; DESCRIPTION: Composite: Creates a orange circular shape at (382, 168) with radius 77 then Places a cyan line segment connecting (181, 147) to (392, 204).
; PLAN: r0=382(x), r1=168(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=147(y1), r7=392(x2), r8=204(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 168
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 147
LDI r7, 392
LDI r8, 204
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
