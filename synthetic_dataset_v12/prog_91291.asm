; DESCRIPTION: Composite: Places a white circle of radius 46 at center (361, 130) then Renders a red line between points (6, 47) and (445, 70) then Renders a green box of size 66x110 starting at (12, 76).
; PLAN: r0=361(x), r1=130(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x1), r6=47(y1), r7=445(x2), r8=70(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=12(x), r11=76(y), r12=66(width), r13=110(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 130
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 47
LDI r7, 445
LDI r8, 70
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 76
LDI r12, 66
LDI r13, 110
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
