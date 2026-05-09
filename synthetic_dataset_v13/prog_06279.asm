; DESCRIPTION: Composite: Renders a green line between points (132, 43) and (410, 5) then Places a purple circle of radius 42 at center (113, 78).
; PLAN: r0=132(x1), r1=43(y1), r2=410(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=78(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 43
LDI r2, 410
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 78
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
