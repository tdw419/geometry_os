; DESCRIPTION: Composite: Creates a cyan circular shape at (305, 103) with radius 23 then Draws a magenta line from (244, 53) to (472, 221).
; PLAN: r0=305(x), r1=103(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x1), r6=53(y1), r7=472(x2), r8=221(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 103
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 53
LDI r7, 472
LDI r8, 221
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
