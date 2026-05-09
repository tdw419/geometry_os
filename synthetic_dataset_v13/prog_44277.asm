; DESCRIPTION: Composite: Places a blue 92x71 rectangle at position (228, 123) then Places a black dot at position (86, 25) then Renders a yellow line between points (352, 37) and (328, 225).
; PLAN: r0=228(x), r1=123(y), r2=92(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=25(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=352(x1), r11=37(y1), r12=328(x2), r13=225(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 123
LDI r2, 92
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 25
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 352
LDI r11, 37
LDI r12, 328
LDI r13, 225
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
