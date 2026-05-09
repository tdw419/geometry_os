; DESCRIPTION: Composite: Places a red circle of radius 17 at center (415, 214) then Draws a white line from (41, 103) to (364, 128).
; PLAN: r0=415(x), r1=214(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x1), r6=103(y1), r7=364(x2), r8=128(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 214
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 103
LDI r7, 364
LDI r8, 128
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
