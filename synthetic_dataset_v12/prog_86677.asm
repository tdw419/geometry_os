; DESCRIPTION: Composite: Creates a orange circular shape at (174, 53) with radius 39 then Sets a single cyan pixel at (346, 26) then Draws a cyan line from (8, 168) to (183, 202).
; PLAN: r0=174(x), r1=53(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=26(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=8(x1), r11=168(y1), r12=183(x2), r13=202(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 53
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 26
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 8
LDI r11, 168
LDI r12, 183
LDI r13, 202
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
