; DESCRIPTION: Composite: Draws a magenta line from (38, 53) to (280, 156) then Places a cyan circle of radius 26 at center (142, 97).
; PLAN: r0=38(x1), r1=53(y1), r2=280(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=97(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 53
LDI r2, 280
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 97
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
