; DESCRIPTION: Composite: Places a cyan dot at position (237, 2) then Creates a red rectangular region at (52, 60) spanning 71 by 28 pixels then Draws a cyan line from (252, 202) to (500, 39).
; PLAN: r0=237(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=60(y), r7=71(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=252(x1), r11=202(y1), r12=500(x2), r13=39(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 60
LDI r7, 71
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 202
LDI r12, 500
LDI r13, 39
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
