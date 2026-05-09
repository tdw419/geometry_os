; DESCRIPTION: Composite: Renders a white line between points (63, 63) and (189, 240) then Places a yellow 39x16 rectangle at position (446, 226) then Places a red dot at position (304, 205).
; PLAN: r0=63(x1), r1=63(y1), r2=189(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=226(y), r7=39(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=205(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 63
LDI r1, 63
LDI r2, 189
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 226
LDI r7, 39
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 205
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
