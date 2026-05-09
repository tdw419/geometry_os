; DESCRIPTION: Composite: Renders a purple line between points (240, 222) and (479, 154) then Renders a red disk with center (463, 152) and radius 47.
; PLAN: r0=240(x1), r1=222(y1), r2=479(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=152(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 222
LDI r2, 479
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 152
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
