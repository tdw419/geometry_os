; DESCRIPTION: Composite: Places a cyan circle of radius 51 at center (147, 154) then Places a purple line segment connecting (215, 67) to (263, 55).
; PLAN: r0=147(x), r1=154(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x1), r6=67(y1), r7=263(x2), r8=55(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 154
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 67
LDI r7, 263
LDI r8, 55
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
