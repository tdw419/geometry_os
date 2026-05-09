; DESCRIPTION: Composite: Draws a purple circle centered at (281, 197) with radius 19 then Draws a cyan line from (283, 117) to (394, 94).
; PLAN: r0=281(x), r1=197(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x1), r6=117(y1), r7=394(x2), r8=94(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 197
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 117
LDI r7, 394
LDI r8, 94
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
