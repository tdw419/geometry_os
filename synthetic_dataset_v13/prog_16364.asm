; DESCRIPTION: Composite: Places a yellow circle of radius 25 at center (231, 214) then Draws a yellow line from (333, 102) to (363, 221) then Places a magenta dot at position (418, 227).
; PLAN: r0=231(x), r1=214(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x1), r6=102(y1), r7=363(x2), r8=221(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=418(x), r11=227(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 214
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 102
LDI r7, 363
LDI r8, 221
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 227
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
