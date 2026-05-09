; DESCRIPTION: Composite: Renders a blue line between points (244, 62) and (175, 28) then Places a yellow 57x95 rectangle at position (408, 113) then Sets a single white pixel at (446, 131).
; PLAN: r0=244(x1), r1=62(y1), r2=175(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=113(y), r7=57(width), r8=95(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x), r11=131(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 62
LDI r2, 175
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 113
LDI r7, 57
LDI r8, 95
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 131
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
