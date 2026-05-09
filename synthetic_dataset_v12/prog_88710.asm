; DESCRIPTION: Composite: Places a cyan circle of radius 43 at center (206, 63) then Draws a magenta line from (171, 182) to (450, 105).
; PLAN: r0=206(x), r1=63(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x1), r6=182(y1), r7=450(x2), r8=105(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 63
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 182
LDI r7, 450
LDI r8, 105
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
