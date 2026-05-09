; DESCRIPTION: Composite: Renders a magenta box of size 55x18 starting at (200, 194) then Places a green line segment connecting (401, 104) to (460, 251) then Places a black circle of radius 74 at center (175, 139).
; PLAN: r0=200(x), r1=194(y), r2=55(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=104(y1), r7=460(x2), r8=251(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=139(y), r12=74(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 194
LDI r2, 55
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 104
LDI r7, 460
LDI r8, 251
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 139
LDI r12, 74
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
