; DESCRIPTION: Composite: Draws a red circle centered at (401, 175) with radius 44 then Places a white dot at position (237, 26) then Places a green line segment connecting (32, 133) to (327, 222).
; PLAN: r0=401(x), r1=175(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=26(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=32(x1), r11=133(y1), r12=327(x2), r13=222(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 175
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 26
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 32
LDI r11, 133
LDI r12, 327
LDI r13, 222
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
