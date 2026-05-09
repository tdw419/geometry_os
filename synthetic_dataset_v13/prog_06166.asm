; DESCRIPTION: Composite: Renders a black line between points (164, 196) and (114, 39) then Places a green dot at position (375, 7) then Renders a cyan box of size 57x111 starting at (325, 29).
; PLAN: r0=164(x1), r1=196(y1), r2=114(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=7(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=325(x), r11=29(y), r12=57(width), r13=111(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 196
LDI r2, 114
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 7
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 325
LDI r11, 29
LDI r12, 57
LDI r13, 111
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
