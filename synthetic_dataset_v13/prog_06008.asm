; DESCRIPTION: Composite: Sets a single yellow pixel at (82, 242) then Creates a red circular shape at (182, 196) with radius 44 then Renders a green line between points (146, 117) and (32, 26).
; PLAN: r0=82(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=196(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x1), r11=117(y1), r12=32(x2), r13=26(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 242
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 182
LDI r6, 196
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 117
LDI r12, 32
LDI r13, 26
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
