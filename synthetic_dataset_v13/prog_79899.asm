; DESCRIPTION: Composite: Creates a magenta circular shape at (286, 50) with radius 26 then Renders a magenta line between points (128, 216) and (401, 98) then Places a blue dot at position (267, 2).
; PLAN: r0=286(x), r1=50(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x1), r6=216(y1), r7=401(x2), r8=98(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=2(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 50
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 216
LDI r7, 401
LDI r8, 98
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 2
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
