; DESCRIPTION: Composite: Draws a white line from (172, 185) to (208, 27) then Places a magenta dot at position (291, 226) then Places a cyan 12x15 rectangle at position (177, 198).
; PLAN: r0=172(x1), r1=185(y1), r2=208(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=226(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=198(y), r12=12(width), r13=15(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 185
LDI r2, 208
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 226
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 177
LDI r11, 198
LDI r12, 12
LDI r13, 15
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
