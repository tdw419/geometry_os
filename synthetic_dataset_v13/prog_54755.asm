; DESCRIPTION: Composite: Draws a cyan circle centered at (271, 85) with radius 69 then Places a blue dot at position (87, 93) then Renders a magenta line between points (280, 8) and (310, 231).
; PLAN: r0=271(x), r1=85(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=93(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=280(x1), r11=8(y1), r12=310(x2), r13=231(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 85
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 93
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 280
LDI r11, 8
LDI r12, 310
LDI r13, 231
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
