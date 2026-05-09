; DESCRIPTION: Composite: Places a blue dot at position (371, 36) then Creates a green circular shape at (123, 66) with radius 31 then Places a cyan line segment connecting (38, 110) to (284, 191).
; PLAN: r0=371(x), r1=36(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=123(x), r6=66(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x1), r11=110(y1), r12=284(x2), r13=191(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 36
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 66
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 110
LDI r12, 284
LDI r13, 191
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
