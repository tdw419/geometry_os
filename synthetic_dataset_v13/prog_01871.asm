; DESCRIPTION: Composite: Draws a cyan line from (372, 57) to (454, 45) then Draws a yellow circle centered at (358, 58) with radius 32.
; PLAN: r0=372(x1), r1=57(y1), r2=454(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=58(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 57
LDI r2, 454
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 58
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
