; DESCRIPTION: Composite: Renders a magenta line between points (479, 16) and (89, 214) then Creates a white circular shape at (210, 82) with radius 47.
; PLAN: r0=479(x1), r1=16(y1), r2=89(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=82(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 479
LDI r1, 16
LDI r2, 89
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 82
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
