; DESCRIPTION: Composite: Renders a cyan box of size 28x26 starting at (401, 49) then Sets a single white pixel at (460, 30) then Draws a yellow line from (220, 88) to (441, 193).
; PLAN: r0=401(x), r1=49(y), r2=28(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=30(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=220(x1), r11=88(y1), r12=441(x2), r13=193(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 49
LDI r2, 28
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 30
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 88
LDI r12, 441
LDI r13, 193
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
