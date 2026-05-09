; DESCRIPTION: Composite: Places a magenta circle of radius 12 at center (358, 144) then Places a blue line segment connecting (479, 135) to (131, 6).
; PLAN: r0=358(x), r1=144(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=135(y1), r7=131(x2), r8=6(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 144
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 135
LDI r7, 131
LDI r8, 6
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
