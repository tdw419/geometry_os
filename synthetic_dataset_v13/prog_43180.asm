; DESCRIPTION: Composite: Draws a cyan circle centered at (132, 127) with radius 77 then Renders a black line between points (474, 6) and (80, 50) then Places a cyan 102x89 rectangle at position (264, 91).
; PLAN: r0=132(x), r1=127(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x1), r6=6(y1), r7=80(x2), r8=50(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=91(y), r12=102(width), r13=89(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 127
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 6
LDI r7, 80
LDI r8, 50
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 91
LDI r12, 102
LDI r13, 89
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
