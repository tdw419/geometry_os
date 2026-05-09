; DESCRIPTION: Composite: Draws a cyan circle centered at (454, 174) with radius 47 then Renders a white line between points (154, 99) and (416, 132) then Places a black dot at position (365, 117).
; PLAN: r0=454(x), r1=174(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x1), r6=99(y1), r7=416(x2), r8=132(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=117(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 454
LDI r1, 174
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 99
LDI r7, 416
LDI r8, 132
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 117
LDI r12, 0x000000
PSET r10, r11, r12
HALT
