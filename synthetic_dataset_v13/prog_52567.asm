; DESCRIPTION: Composite: Creates a magenta rectangular region at (338, 11) spanning 117 by 82 pixels then Renders a green line between points (202, 121) and (485, 253).
; PLAN: r0=338(x), r1=11(y), r2=117(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x1), r6=121(y1), r7=485(x2), r8=253(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 11
LDI r2, 117
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 121
LDI r7, 485
LDI r8, 253
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
