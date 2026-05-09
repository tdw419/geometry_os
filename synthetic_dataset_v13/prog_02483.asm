; DESCRIPTION: Composite: Places a cyan line segment connecting (38, 128) to (354, 205) then Places a orange circle of radius 61 at center (170, 98).
; PLAN: r0=38(x1), r1=128(y1), r2=354(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=98(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 128
LDI r2, 354
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 98
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
