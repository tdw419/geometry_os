; DESCRIPTION: Composite: Draws a orange line from (330, 233) to (335, 98) then Renders a cyan disk with center (283, 86) and radius 29.
; PLAN: r0=330(x1), r1=233(y1), r2=335(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=86(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 233
LDI r2, 335
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 86
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
