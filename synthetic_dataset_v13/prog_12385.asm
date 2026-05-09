; DESCRIPTION: Composite: Renders a cyan disk with center (155, 213) and radius 36 then Draws a red line from (346, 210) to (85, 174) then Creates a magenta rectangular region at (104, 15) spanning 120 by 77 pixels.
; PLAN: r0=155(x), r1=213(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x1), r6=210(y1), r7=85(x2), r8=174(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=15(y), r12=120(width), r13=77(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 213
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 210
LDI r7, 85
LDI r8, 174
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 15
LDI r12, 120
LDI r13, 77
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
