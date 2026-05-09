; DESCRIPTION: Composite: Sets a single green pixel at (455, 103) then Draws a orange rectangle at (274, 112) with width 40 and height 61 then Draws a white line from (401, 240) to (354, 44).
; PLAN: r0=455(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=112(y), r7=40(width), r8=61(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x1), r11=240(y1), r12=354(x2), r13=44(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 274
LDI r6, 112
LDI r7, 40
LDI r8, 61
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 240
LDI r12, 354
LDI r13, 44
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
