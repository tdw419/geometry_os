; DESCRIPTION: Composite: Sets a single red pixel at (320, 54) then Draws a yellow line from (404, 77) to (115, 208) then Places a white 32x39 rectangle at position (344, 133).
; PLAN: r0=320(x), r1=54(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=404(x1), r6=77(y1), r7=115(x2), r8=208(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=133(y), r12=32(width), r13=39(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 54
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 404
LDI r6, 77
LDI r7, 115
LDI r8, 208
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 133
LDI r12, 32
LDI r13, 39
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
