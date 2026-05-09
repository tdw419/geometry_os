; DESCRIPTION: Composite: Draws a yellow circle centered at (198, 196) with radius 25 then Draws a cyan line from (66, 239) to (13, 253) then Places a cyan dot at position (124, 2).
; PLAN: r0=198(x), r1=196(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x1), r6=239(y1), r7=13(x2), r8=253(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=2(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 196
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 239
LDI r7, 13
LDI r8, 253
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 2
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
