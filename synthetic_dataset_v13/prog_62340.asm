; DESCRIPTION: Composite: Creates a magenta circular shape at (400, 79) with radius 39 then Places a yellow dot at position (456, 108) then Draws a magenta line from (166, 36) to (335, 108).
; PLAN: r0=400(x), r1=79(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=108(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=166(x1), r11=36(y1), r12=335(x2), r13=108(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 79
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 108
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 166
LDI r11, 36
LDI r12, 335
LDI r13, 108
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
