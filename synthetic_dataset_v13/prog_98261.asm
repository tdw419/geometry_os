; DESCRIPTION: Composite: Renders a orange line between points (299, 210) and (39, 159) then Places a magenta circle of radius 47 at center (271, 207).
; PLAN: r0=299(x1), r1=210(y1), r2=39(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=207(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 210
LDI r2, 39
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 207
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
