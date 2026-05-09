; DESCRIPTION: Composite: Sets a single purple pixel at (102, 58) then Draws a cyan circle centered at (394, 103) with radius 44 then Draws a green line from (383, 200) to (49, 233).
; PLAN: r0=102(x), r1=58(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=103(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x1), r11=200(y1), r12=49(x2), r13=233(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 58
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 103
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 200
LDI r12, 49
LDI r13, 233
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
