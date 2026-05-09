; DESCRIPTION: Composite: Renders a green line between points (76, 114) and (39, 63) then Places a green dot at position (103, 87) then Places a magenta circle of radius 18 at center (298, 111).
; PLAN: r0=76(x1), r1=114(y1), r2=39(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=87(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=111(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 114
LDI r2, 39
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 87
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 298
LDI r11, 111
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
