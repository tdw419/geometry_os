; DESCRIPTION: Composite: Renders a yellow disk with center (286, 103) and radius 27 then Renders a purple box of size 47x113 starting at (44, 73) then Places a blue dot at position (201, 81).
; PLAN: r0=286(x), r1=103(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=73(y), r7=47(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=81(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 103
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 73
LDI r7, 47
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 81
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
