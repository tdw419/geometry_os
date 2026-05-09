; DESCRIPTION: Composite: Places a magenta dot at position (64, 247) then Places a green circle of radius 68 at center (428, 186) then Draws a black line from (429, 135) to (450, 254).
; PLAN: r0=64(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=186(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x1), r11=135(y1), r12=450(x2), r13=254(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 186
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 135
LDI r12, 450
LDI r13, 254
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
