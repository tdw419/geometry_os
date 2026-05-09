; DESCRIPTION: Composite: Creates a blue rectangular region at (124, 28) spanning 76 by 110 pixels then Places a red dot at position (443, 67) then Draws a cyan line from (236, 113) to (434, 241).
; PLAN: r0=124(x), r1=28(y), r2=76(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=67(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=236(x1), r11=113(y1), r12=434(x2), r13=241(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 28
LDI r2, 76
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 67
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 236
LDI r11, 113
LDI r12, 434
LDI r13, 241
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
