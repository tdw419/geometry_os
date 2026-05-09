; DESCRIPTION: Composite: Places a orange dot at position (214, 215) then Places a orange 25x31 rectangle at position (41, 190) then Renders a yellow line between points (377, 21) and (203, 113).
; PLAN: r0=214(x), r1=215(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=190(y), r7=25(width), r8=31(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x1), r11=21(y1), r12=203(x2), r13=113(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 215
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 41
LDI r6, 190
LDI r7, 25
LDI r8, 31
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 21
LDI r12, 203
LDI r13, 113
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
