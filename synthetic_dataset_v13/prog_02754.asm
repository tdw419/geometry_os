; DESCRIPTION: Composite: Places a magenta dot at position (61, 130) then Renders a red line between points (273, 177) and (1, 143) then Places a orange 81x40 rectangle at position (374, 14).
; PLAN: r0=61(x), r1=130(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=273(x1), r6=177(y1), r7=1(x2), r8=143(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=14(y), r12=81(width), r13=40(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 130
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 177
LDI r7, 1
LDI r8, 143
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 14
LDI r12, 81
LDI r13, 40
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
