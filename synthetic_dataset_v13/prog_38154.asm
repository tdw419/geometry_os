; DESCRIPTION: Composite: Places a white 110x94 rectangle at position (113, 47) then Places a black line segment connecting (123, 135) to (326, 242) then Places a green dot at position (471, 18).
; PLAN: r0=113(x), r1=47(y), r2=110(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=135(y1), r7=326(x2), r8=242(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=18(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 113
LDI r1, 47
LDI r2, 110
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 135
LDI r7, 326
LDI r8, 242
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 18
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
