; DESCRIPTION: Composite: Draws a red line from (464, 52) to (456, 144) then Places a magenta dot at position (266, 22) then Renders a cyan disk with center (144, 186) and radius 54.
; PLAN: r0=464(x1), r1=52(y1), r2=456(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=22(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=144(x), r11=186(y), r12=54(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 52
LDI r2, 456
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 22
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 144
LDI r11, 186
LDI r12, 54
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
