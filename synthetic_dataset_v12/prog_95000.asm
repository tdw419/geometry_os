; DESCRIPTION: Composite: Places a yellow dot at position (399, 114) then Draws a cyan circle centered at (137, 77) with radius 57 then Draws a magenta line from (342, 42) to (100, 83).
; PLAN: r0=399(x), r1=114(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=77(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x1), r11=42(y1), r12=100(x2), r13=83(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 114
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 137
LDI r6, 77
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 42
LDI r12, 100
LDI r13, 83
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
