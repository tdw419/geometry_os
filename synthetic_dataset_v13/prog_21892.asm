; DESCRIPTION: Composite: Places a white dot at position (401, 31) then Draws a blue circle centered at (333, 86) with radius 19 then Draws a orange line from (279, 18) to (429, 117).
; PLAN: r0=401(x), r1=31(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=86(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x1), r11=18(y1), r12=429(x2), r13=117(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 31
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 333
LDI r6, 86
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 18
LDI r12, 429
LDI r13, 117
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
