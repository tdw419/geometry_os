; DESCRIPTION: Composite: Creates a yellow rectangular region at (243, 162) spanning 29 by 73 pixels then Draws a cyan line from (155, 28) to (418, 214).
; PLAN: r0=243(x), r1=162(y), r2=29(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x1), r6=28(y1), r7=418(x2), r8=214(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 162
LDI r2, 29
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 28
LDI r7, 418
LDI r8, 214
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
