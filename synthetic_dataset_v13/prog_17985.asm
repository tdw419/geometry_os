; DESCRIPTION: Composite: Renders a yellow line between points (309, 46) and (175, 243) then Places a white dot at position (363, 65) then Places a cyan 49x52 rectangle at position (335, 59).
; PLAN: r0=309(x1), r1=46(y1), r2=175(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=65(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=335(x), r11=59(y), r12=49(width), r13=52(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 46
LDI r2, 175
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 65
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 335
LDI r11, 59
LDI r12, 49
LDI r13, 52
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
