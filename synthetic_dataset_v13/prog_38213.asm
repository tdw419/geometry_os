; DESCRIPTION: Composite: Sets a single green pixel at (475, 193) then Draws a yellow line from (236, 182) to (407, 226) then Renders a cyan box of size 56x43 starting at (96, 43).
; PLAN: r0=475(x), r1=193(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=236(x1), r6=182(y1), r7=407(x2), r8=226(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=43(y), r12=56(width), r13=43(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 193
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 236
LDI r6, 182
LDI r7, 407
LDI r8, 226
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 43
LDI r12, 56
LDI r13, 43
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
