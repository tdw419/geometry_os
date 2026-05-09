; DESCRIPTION: Composite: Draws a yellow line from (310, 50) to (298, 238) then Places a green dot at position (372, 202).
; PLAN: r0=310(x1), r1=50(y1), r2=298(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=202(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 310
LDI r1, 50
LDI r2, 298
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 202
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
