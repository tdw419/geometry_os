; DESCRIPTION: Composite: Creates a orange circular shape at (394, 43) with radius 27 then Draws a green line from (408, 161) to (217, 241).
; PLAN: r0=394(x), r1=43(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x1), r6=161(y1), r7=217(x2), r8=241(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 43
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 161
LDI r7, 217
LDI r8, 241
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
