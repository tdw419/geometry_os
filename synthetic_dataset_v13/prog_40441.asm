; DESCRIPTION: Composite: Places a purple dot at position (429, 237) then Draws a magenta line from (14, 5) to (65, 180) then Renders a cyan disk with center (142, 114) and radius 42.
; PLAN: r0=429(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=5(y1), r7=65(x2), r8=180(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=114(y), r12=42(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 14
LDI r6, 5
LDI r7, 65
LDI r8, 180
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 114
LDI r12, 42
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
