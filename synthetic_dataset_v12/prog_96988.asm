; DESCRIPTION: Composite: Places a blue circle of radius 31 at center (39, 42) then Places a cyan line segment connecting (296, 97) to (393, 224).
; PLAN: r0=39(x), r1=42(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x1), r6=97(y1), r7=393(x2), r8=224(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 42
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 97
LDI r7, 393
LDI r8, 224
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
