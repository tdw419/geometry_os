; DESCRIPTION: Composite: Sets a single yellow pixel at (328, 174) then Draws a orange rectangle at (307, 113) with width 60 and height 115 then Draws a cyan line from (396, 33) to (241, 193).
; PLAN: r0=328(x), r1=174(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=113(y), r7=60(width), r8=115(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x1), r11=33(y1), r12=241(x2), r13=193(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 174
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 307
LDI r6, 113
LDI r7, 60
LDI r8, 115
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 33
LDI r12, 241
LDI r13, 193
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
