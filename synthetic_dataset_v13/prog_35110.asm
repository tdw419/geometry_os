; DESCRIPTION: Composite: Creates a magenta circular shape at (153, 126) with radius 56 then Places a green line segment connecting (300, 134) to (479, 245).
; PLAN: r0=153(x), r1=126(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=134(y1), r7=479(x2), r8=245(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 126
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 134
LDI r7, 479
LDI r8, 245
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
