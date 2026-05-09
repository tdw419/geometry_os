; DESCRIPTION: Composite: Places a orange dot at position (346, 223) then Draws a magenta line from (434, 122) to (386, 41) then Creates a green circular shape at (405, 122) with radius 80.
; PLAN: r0=346(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=434(x1), r6=122(y1), r7=386(x2), r8=41(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=122(y), r12=80(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 223
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 434
LDI r6, 122
LDI r7, 386
LDI r8, 41
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 122
LDI r12, 80
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
