; DESCRIPTION: Composite: Places a yellow dot at position (466, 63) then Draws a red rectangle at (126, 114) with width 28 and height 119 then Renders a cyan line between points (386, 193) and (63, 83).
; PLAN: r0=466(x), r1=63(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=114(y), r7=28(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x1), r11=193(y1), r12=63(x2), r13=83(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 63
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 126
LDI r6, 114
LDI r7, 28
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 193
LDI r12, 63
LDI r13, 83
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
