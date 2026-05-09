; DESCRIPTION: Composite: Places a cyan dot at position (474, 3) then Draws a white line from (120, 105) to (440, 38) then Places a cyan 21x104 rectangle at position (25, 52).
; PLAN: r0=474(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=120(x1), r6=105(y1), r7=440(x2), r8=38(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=25(x), r11=52(y), r12=21(width), r13=104(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 3
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 120
LDI r6, 105
LDI r7, 440
LDI r8, 38
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 52
LDI r12, 21
LDI r13, 104
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
