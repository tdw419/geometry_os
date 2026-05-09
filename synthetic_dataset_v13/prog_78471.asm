; DESCRIPTION: Composite: Renders a white line between points (140, 181) and (18, 213) then Draws a cyan circle centered at (174, 130) with radius 63.
; PLAN: r0=140(x1), r1=181(y1), r2=18(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=130(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 181
LDI r2, 18
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 130
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
