; DESCRIPTION: Composite: Draws a black line from (207, 27) to (302, 69) then Renders a cyan disk with center (173, 226) and radius 21.
; PLAN: r0=207(x1), r1=27(y1), r2=302(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=226(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 207
LDI r1, 27
LDI r2, 302
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 226
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
