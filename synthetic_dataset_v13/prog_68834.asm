; DESCRIPTION: Composite: Renders a magenta line between points (405, 59) and (105, 248) then Places a cyan dot at position (362, 205) then Draws a green rectangle at (319, 3) with width 27 and height 65.
; PLAN: r0=405(x1), r1=59(y1), r2=105(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=205(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=319(x), r11=3(y), r12=27(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 59
LDI r2, 105
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 205
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 319
LDI r11, 3
LDI r12, 27
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
