; DESCRIPTION: Composite: Draws a purple circle centered at (454, 53) with radius 18 then Draws a cyan line from (450, 128) to (4, 231).
; PLAN: r0=454(x), r1=53(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=128(y1), r7=4(x2), r8=231(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 53
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 128
LDI r7, 4
LDI r8, 231
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
