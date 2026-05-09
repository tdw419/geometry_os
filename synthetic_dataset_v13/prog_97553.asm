; DESCRIPTION: Composite: Places a magenta line segment connecting (219, 139) to (127, 209) then Renders a purple disk with center (162, 149) and radius 27.
; PLAN: r0=219(x1), r1=139(y1), r2=127(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=149(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 219
LDI r1, 139
LDI r2, 127
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 149
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
