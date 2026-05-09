; DESCRIPTION: Composite: Places a black dot at position (275, 187) then Renders a magenta line between points (42, 211) and (510, 117) then Places a green 26x74 rectangle at position (422, 156).
; PLAN: r0=275(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=211(y1), r7=510(x2), r8=117(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=156(y), r12=26(width), r13=74(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 42
LDI r6, 211
LDI r7, 510
LDI r8, 117
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 156
LDI r12, 26
LDI r13, 74
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
