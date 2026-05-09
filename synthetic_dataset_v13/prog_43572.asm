; DESCRIPTION: Composite: Renders a cyan disk with center (418, 123) and radius 55 then Places a yellow line segment connecting (160, 16) to (255, 236).
; PLAN: r0=418(x), r1=123(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x1), r6=16(y1), r7=255(x2), r8=236(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 123
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 16
LDI r7, 255
LDI r8, 236
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
