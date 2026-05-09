; DESCRIPTION: Composite: Places a blue dot at position (218, 104) then Places a yellow line segment connecting (354, 128) to (261, 173).
; PLAN: r0=218(x), r1=104(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=354(x1), r6=128(y1), r7=261(x2), r8=173(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 104
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 354
LDI r6, 128
LDI r7, 261
LDI r8, 173
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
