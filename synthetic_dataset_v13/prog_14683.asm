; DESCRIPTION: Composite: Renders a cyan line between points (210, 30) and (265, 186) then Places a magenta dot at position (334, 126) then Renders a blue box of size 39x51 starting at (294, 85).
; PLAN: r0=210(x1), r1=30(y1), r2=265(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=126(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=294(x), r11=85(y), r12=39(width), r13=51(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 30
LDI r2, 265
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 126
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 294
LDI r11, 85
LDI r12, 39
LDI r13, 51
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
