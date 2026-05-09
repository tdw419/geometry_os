; DESCRIPTION: Composite: Draws a cyan line from (49, 19) to (275, 35) then Renders a red disk with center (428, 66) and radius 57.
; PLAN: r0=49(x1), r1=19(y1), r2=275(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=66(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 19
LDI r2, 275
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 66
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
