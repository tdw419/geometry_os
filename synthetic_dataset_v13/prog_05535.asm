; DESCRIPTION: Composite: Draws a magenta line from (405, 98) to (397, 124) then Places a magenta circle of radius 62 at center (287, 180).
; PLAN: r0=405(x1), r1=98(y1), r2=397(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=180(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 405
LDI r1, 98
LDI r2, 397
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 180
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
