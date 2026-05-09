; DESCRIPTION: Composite: Renders a yellow box of size 113x108 starting at (36, 98) then Draws a black line from (433, 6) to (104, 57) then Sets a single white pixel at (386, 60).
; PLAN: r0=36(x), r1=98(y), r2=113(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=6(y1), r7=104(x2), r8=57(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=60(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 98
LDI r2, 113
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 6
LDI r7, 104
LDI r8, 57
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 60
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
