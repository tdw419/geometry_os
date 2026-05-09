; DESCRIPTION: Composite: Draws a cyan circle centered at (124, 187) with radius 16 then Places a magenta line segment connecting (213, 85) to (8, 190).
; PLAN: r0=124(x), r1=187(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x1), r6=85(y1), r7=8(x2), r8=190(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 187
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 85
LDI r7, 8
LDI r8, 190
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
