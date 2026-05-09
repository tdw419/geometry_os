; DESCRIPTION: Composite: Places a yellow 118x120 rectangle at position (98, 9) then Draws a white line from (78, 10) to (504, 129) then Draws a cyan circle centered at (153, 101) with radius 77.
; PLAN: r0=98(x), r1=9(y), r2=118(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x1), r6=10(y1), r7=504(x2), r8=129(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=101(y), r12=77(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 9
LDI r2, 118
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 10
LDI r7, 504
LDI r8, 129
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 101
LDI r12, 77
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
