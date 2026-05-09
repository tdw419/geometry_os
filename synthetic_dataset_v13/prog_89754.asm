; DESCRIPTION: Composite: Creates a red circular shape at (294, 94) with radius 57 then Places a yellow dot at position (15, 102) then Places a magenta line segment connecting (39, 41) to (429, 146).
; PLAN: r0=294(x), r1=94(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=102(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=39(x1), r11=41(y1), r12=429(x2), r13=146(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 94
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 102
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 39
LDI r11, 41
LDI r12, 429
LDI r13, 146
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
