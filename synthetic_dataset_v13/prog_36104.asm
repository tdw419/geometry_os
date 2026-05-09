; DESCRIPTION: Composite: Creates a orange rectangular region at (353, 154) spanning 22 by 71 pixels then Renders a red line between points (275, 27) and (94, 6) then Renders a cyan disk with center (435, 120) and radius 74.
; PLAN: r0=353(x), r1=154(y), r2=22(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=27(y1), r7=94(x2), r8=6(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=120(y), r12=74(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 154
LDI r2, 22
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 27
LDI r7, 94
LDI r8, 6
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 120
LDI r12, 74
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
