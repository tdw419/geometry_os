; DESCRIPTION: Composite: Sets a single white pixel at (346, 125) then Creates a white circular shape at (443, 171) with radius 58 then Draws a blue line from (343, 111) to (284, 238).
; PLAN: r0=346(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=443(x), r6=171(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=343(x1), r11=111(y1), r12=284(x2), r13=238(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 443
LDI r6, 171
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 343
LDI r11, 111
LDI r12, 284
LDI r13, 238
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
