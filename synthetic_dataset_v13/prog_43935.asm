; DESCRIPTION: Composite: Draws a white line from (294, 142) to (387, 146) then Places a white dot at position (117, 60) then Renders a orange disk with center (215, 72) and radius 34.
; PLAN: r0=294(x1), r1=142(y1), r2=387(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=60(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=72(y), r12=34(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 294
LDI r1, 142
LDI r2, 387
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 60
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 72
LDI r12, 34
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
