; DESCRIPTION: Composite: Places a black 52x23 rectangle at position (458, 30) then Places a cyan dot at position (123, 111) then Renders a green line between points (124, 130) and (181, 127).
; PLAN: r0=458(x), r1=30(y), r2=52(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=111(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=124(x1), r11=130(y1), r12=181(x2), r13=127(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 30
LDI r2, 52
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 111
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 124
LDI r11, 130
LDI r12, 181
LDI r13, 127
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
