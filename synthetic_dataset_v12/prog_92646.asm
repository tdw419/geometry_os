; DESCRIPTION: Composite: Sets a single green pixel at (422, 214) then Places a magenta circle of radius 70 at center (217, 151) then Places a cyan line segment connecting (121, 82) to (19, 182).
; PLAN: r0=422(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=151(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x1), r11=82(y1), r12=19(x2), r13=182(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 217
LDI r6, 151
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 82
LDI r12, 19
LDI r13, 182
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
