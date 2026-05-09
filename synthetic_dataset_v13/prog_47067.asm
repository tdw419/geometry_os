; DESCRIPTION: Composite: Renders a black line between points (50, 94) and (433, 69) then Places a cyan circle of radius 13 at center (126, 17) then Places a blue dot at position (275, 132).
; PLAN: r0=50(x1), r1=94(y1), r2=433(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=17(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=275(x), r11=132(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 94
LDI r2, 433
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 17
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 275
LDI r11, 132
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
