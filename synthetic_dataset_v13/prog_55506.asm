; DESCRIPTION: Composite: Draws a cyan line from (325, 251) to (151, 146) then Places a yellow circle of radius 24 at center (287, 215).
; PLAN: r0=325(x1), r1=251(y1), r2=151(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=215(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 251
LDI r2, 151
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 215
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
