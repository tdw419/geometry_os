; DESCRIPTION: Composite: Sets a single white pixel at (435, 132) then Places a blue line segment connecting (270, 60) to (281, 254).
; PLAN: r0=435(x), r1=132(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=270(x1), r6=60(y1), r7=281(x2), r8=254(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 132
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 60
LDI r7, 281
LDI r8, 254
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
