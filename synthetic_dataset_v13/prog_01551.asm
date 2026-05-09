; DESCRIPTION: Composite: Renders a red line between points (488, 226) and (435, 250) then Renders a red box of size 59x44 starting at (302, 3) then Sets a single magenta pixel at (500, 29).
; PLAN: r0=488(x1), r1=226(y1), r2=435(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=3(y), r7=59(width), r8=44(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=500(x), r11=29(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 488
LDI r1, 226
LDI r2, 435
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 3
LDI r7, 59
LDI r8, 44
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 29
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
