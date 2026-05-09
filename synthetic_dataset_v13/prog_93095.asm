; DESCRIPTION: Composite: Places a cyan line segment connecting (119, 20) to (29, 239) then Places a white 35x54 rectangle at position (227, 64) then Places a green dot at position (305, 25).
; PLAN: r0=119(x1), r1=20(y1), r2=29(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=64(y), r7=35(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x), r11=25(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 20
LDI r2, 29
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 64
LDI r7, 35
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 25
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
