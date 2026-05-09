; DESCRIPTION: Composite: Places a white 91x88 rectangle at position (36, 129) then Renders a yellow disk with center (193, 46) and radius 34 then Draws a cyan line from (505, 75) to (356, 9).
; PLAN: r0=36(x), r1=129(y), r2=91(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=46(y), r7=34(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x1), r11=75(y1), r12=356(x2), r13=9(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 129
LDI r2, 91
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 46
LDI r7, 34
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 75
LDI r12, 356
LDI r13, 9
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
