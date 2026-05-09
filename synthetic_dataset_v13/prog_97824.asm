; DESCRIPTION: Composite: Places a yellow circle of radius 36 at center (154, 206) then Places a cyan line segment connecting (87, 236) to (145, 47).
; PLAN: r0=154(x), r1=206(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=236(y1), r7=145(x2), r8=47(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 206
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 236
LDI r7, 145
LDI r8, 47
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
