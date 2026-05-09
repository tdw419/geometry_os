; DESCRIPTION: Composite: Creates a red rectangular region at (196, 64) spanning 30 by 40 pixels then Places a red dot at position (265, 228) then Draws a magenta line from (235, 89) to (12, 176).
; PLAN: r0=196(x), r1=64(y), r2=30(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=228(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=235(x1), r11=89(y1), r12=12(x2), r13=176(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 64
LDI r2, 30
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 228
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 235
LDI r11, 89
LDI r12, 12
LDI r13, 176
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
