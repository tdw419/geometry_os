; DESCRIPTION: Composite: Renders a cyan line between points (475, 97) and (123, 108) then Draws a yellow circle centered at (19, 70) with radius 13.
; PLAN: r0=475(x1), r1=97(y1), r2=123(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=70(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 475
LDI r1, 97
LDI r2, 123
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 70
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
