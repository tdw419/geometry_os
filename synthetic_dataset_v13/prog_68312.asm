; DESCRIPTION: Composite: Sets a single magenta pixel at (73, 47) then Places a yellow circle of radius 40 at center (68, 66) then Renders a orange line between points (401, 57) and (342, 83).
; PLAN: r0=73(x), r1=47(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=66(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x1), r11=57(y1), r12=342(x2), r13=83(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 47
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 66
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 57
LDI r12, 342
LDI r13, 83
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
