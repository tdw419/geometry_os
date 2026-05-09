; DESCRIPTION: Composite: Creates a purple rectangular region at (293, 155) spanning 72 by 92 pixels then Renders a yellow line between points (346, 239) and (371, 245) then Sets a single cyan pixel at (73, 159).
; PLAN: r0=293(x), r1=155(y), r2=72(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x1), r6=239(y1), r7=371(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=159(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 155
LDI r2, 72
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 239
LDI r7, 371
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 159
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
