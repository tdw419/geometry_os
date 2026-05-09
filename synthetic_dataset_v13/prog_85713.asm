; DESCRIPTION: Composite: Renders a blue line between points (364, 196) and (38, 135) then Places a magenta dot at position (58, 147).
; PLAN: r0=364(x1), r1=196(y1), r2=38(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=58(x), r6=147(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 196
LDI r2, 38
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 147
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
