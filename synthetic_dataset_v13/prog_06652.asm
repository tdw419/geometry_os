; DESCRIPTION: Composite: Renders a purple disk with center (184, 111) and radius 13 then Renders a yellow line between points (492, 168) and (305, 57) then Places a green dot at position (35, 250).
; PLAN: r0=184(x), r1=111(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=168(y1), r7=305(x2), r8=57(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=250(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 111
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 168
LDI r7, 305
LDI r8, 57
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 250
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
