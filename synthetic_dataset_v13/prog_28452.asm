; DESCRIPTION: Composite: Renders a cyan box of size 57x95 starting at (27, 85) then Renders a blue disk with center (196, 113) and radius 67 then Draws a cyan line from (98, 96) to (72, 142).
; PLAN: r0=27(x), r1=85(y), r2=57(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x), r6=113(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x1), r11=96(y1), r12=72(x2), r13=142(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 85
LDI r2, 57
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 113
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 96
LDI r12, 72
LDI r13, 142
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
