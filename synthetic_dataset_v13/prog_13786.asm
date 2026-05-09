; DESCRIPTION: Composite: Places a blue line segment connecting (224, 91) to (326, 92) then Places a cyan circle of radius 26 at center (272, 187).
; PLAN: r0=224(x1), r1=91(y1), r2=326(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=187(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 224
LDI r1, 91
LDI r2, 326
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 187
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
