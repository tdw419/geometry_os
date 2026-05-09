; DESCRIPTION: Composite: Renders a cyan disk with center (167, 210) and radius 18 then Places a purple dot at position (482, 56) then Draws a purple line from (357, 188) to (168, 75).
; PLAN: r0=167(x), r1=210(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x), r6=56(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=357(x1), r11=188(y1), r12=168(x2), r13=75(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 210
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 56
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 357
LDI r11, 188
LDI r12, 168
LDI r13, 75
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
