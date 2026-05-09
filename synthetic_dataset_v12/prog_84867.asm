; DESCRIPTION: Composite: Sets a single red pixel at (212, 90) then Places a magenta circle of radius 42 at center (61, 177) then Places a cyan line segment connecting (502, 45) to (98, 218).
; PLAN: r0=212(x), r1=90(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=177(y), r7=42(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=502(x1), r11=45(y1), r12=98(x2), r13=218(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 90
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 61
LDI r6, 177
LDI r7, 42
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 502
LDI r11, 45
LDI r12, 98
LDI r13, 218
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
