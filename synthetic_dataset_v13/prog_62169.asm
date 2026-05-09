; DESCRIPTION: Composite: Creates a magenta circular shape at (428, 186) with radius 47 then Sets a single white pixel at (354, 168) then Renders a purple line between points (204, 214) and (307, 159).
; PLAN: r0=428(x), r1=186(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=168(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=204(x1), r11=214(y1), r12=307(x2), r13=159(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 186
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 168
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 214
LDI r12, 307
LDI r13, 159
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
