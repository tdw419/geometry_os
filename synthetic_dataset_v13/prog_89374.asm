; DESCRIPTION: Composite: Renders a red disk with center (261, 139) and radius 75 then Places a white dot at position (168, 86) then Renders a green line between points (387, 143) and (146, 109).
; PLAN: r0=261(x), r1=139(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=86(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=387(x1), r11=143(y1), r12=146(x2), r13=109(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 139
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 86
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 387
LDI r11, 143
LDI r12, 146
LDI r13, 109
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
