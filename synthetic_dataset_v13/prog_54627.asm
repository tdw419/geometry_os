; DESCRIPTION: Composite: Draws a cyan line from (428, 52) to (506, 7) then Places a yellow circle of radius 64 at center (192, 177).
; PLAN: r0=428(x1), r1=52(y1), r2=506(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=177(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 428
LDI r1, 52
LDI r2, 506
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 177
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
