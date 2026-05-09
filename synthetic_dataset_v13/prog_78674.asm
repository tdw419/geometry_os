; DESCRIPTION: Composite: Draws a cyan line from (196, 15) to (246, 74) then Renders a white disk with center (205, 63) and radius 42 then Renders a purple box of size 38x92 starting at (35, 97).
; PLAN: r0=196(x1), r1=15(y1), r2=246(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=63(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=35(x), r11=97(y), r12=38(width), r13=92(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 15
LDI r2, 246
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 63
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 35
LDI r11, 97
LDI r12, 38
LDI r13, 92
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
