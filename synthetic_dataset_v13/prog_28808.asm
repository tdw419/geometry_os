; DESCRIPTION: Composite: Places a orange dot at position (120, 209) then Draws a yellow line from (21, 125) to (406, 81) then Renders a cyan box of size 117x116 starting at (182, 11).
; PLAN: r0=120(x), r1=209(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=125(y1), r7=406(x2), r8=81(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=11(y), r12=117(width), r13=116(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 209
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 21
LDI r6, 125
LDI r7, 406
LDI r8, 81
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 11
LDI r12, 117
LDI r13, 116
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
