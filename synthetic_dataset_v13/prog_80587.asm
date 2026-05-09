; DESCRIPTION: Composite: Renders a cyan box of size 67x100 starting at (304, 128) then Draws a blue line from (272, 198) to (497, 1) then Sets a single white pixel at (277, 196).
; PLAN: r0=304(x), r1=128(y), r2=67(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x1), r6=198(y1), r7=497(x2), r8=1(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=277(x), r11=196(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 128
LDI r2, 67
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 198
LDI r7, 497
LDI r8, 1
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 196
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
