; DESCRIPTION: Composite: Places a green 76x52 rectangle at position (88, 57) then Places a white line segment connecting (113, 9) to (110, 20) then Places a cyan dot at position (474, 46).
; PLAN: r0=88(x), r1=57(y), r2=76(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x1), r6=9(y1), r7=110(x2), r8=20(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=474(x), r11=46(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 57
LDI r2, 76
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 9
LDI r7, 110
LDI r8, 20
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 46
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
