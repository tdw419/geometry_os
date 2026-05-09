; DESCRIPTION: Composite: Sets a single magenta pixel at (125, 157) then Draws a white circle centered at (304, 164) with radius 40 then Draws a blue line from (113, 73) to (315, 228).
; PLAN: r0=125(x), r1=157(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=164(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x1), r11=73(y1), r12=315(x2), r13=228(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 157
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 164
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 73
LDI r12, 315
LDI r13, 228
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
