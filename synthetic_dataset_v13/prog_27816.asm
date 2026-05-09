; DESCRIPTION: Composite: Places a yellow circle of radius 32 at center (420, 53) then Places a magenta line segment connecting (509, 178) to (19, 190).
; PLAN: r0=420(x), r1=53(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=509(x1), r6=178(y1), r7=19(x2), r8=190(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 53
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 509
LDI r6, 178
LDI r7, 19
LDI r8, 190
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
