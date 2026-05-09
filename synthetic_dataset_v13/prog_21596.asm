; DESCRIPTION: Composite: Renders a orange line between points (446, 213) and (23, 213) then Draws a cyan circle centered at (457, 220) with radius 34.
; PLAN: r0=446(x1), r1=213(y1), r2=23(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=220(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 446
LDI r1, 213
LDI r2, 23
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 220
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
