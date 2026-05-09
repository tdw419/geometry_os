; DESCRIPTION: Composite: Draws a blue line from (328, 9) to (168, 177) then Places a magenta circle of radius 69 at center (443, 137).
; PLAN: r0=328(x1), r1=9(y1), r2=168(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=137(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 9
LDI r2, 168
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 137
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
