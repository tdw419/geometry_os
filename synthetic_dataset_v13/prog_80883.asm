; DESCRIPTION: Composite: Places a magenta line segment connecting (197, 228) to (65, 33) then Creates a green circular shape at (98, 98) with radius 43.
; PLAN: r0=197(x1), r1=228(y1), r2=65(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=98(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 197
LDI r1, 228
LDI r2, 65
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 98
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
