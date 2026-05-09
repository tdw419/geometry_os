; DESCRIPTION: Composite: Places a red 24x82 rectangle at position (373, 152) then Sets a single white pixel at (67, 33) then Renders a blue line between points (228, 241) and (292, 106).
; PLAN: r0=373(x), r1=152(y), r2=24(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=33(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=228(x1), r11=241(y1), r12=292(x2), r13=106(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 152
LDI r2, 24
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 33
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 228
LDI r11, 241
LDI r12, 292
LDI r13, 106
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
