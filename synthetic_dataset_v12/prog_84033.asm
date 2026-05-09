; DESCRIPTION: Composite: Places a red dot at position (374, 236) then Draws a white circle centered at (349, 120) with radius 58 then Places a blue line segment connecting (115, 221) to (460, 210).
; PLAN: r0=374(x), r1=236(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=120(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x1), r11=221(y1), r12=460(x2), r13=210(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 236
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 349
LDI r6, 120
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 221
LDI r12, 460
LDI r13, 210
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
