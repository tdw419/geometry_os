; DESCRIPTION: Composite: Places a white line segment connecting (211, 140) to (336, 168) then Sets a single green pixel at (6, 221) then Renders a yellow box of size 75x56 starting at (57, 152).
; PLAN: r0=211(x1), r1=140(y1), r2=336(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=221(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=57(x), r11=152(y), r12=75(width), r13=56(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 140
LDI r2, 336
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 221
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 57
LDI r11, 152
LDI r12, 75
LDI r13, 56
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
