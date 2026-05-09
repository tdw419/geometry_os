; DESCRIPTION: Composite: Draws a green line from (21, 109) to (45, 242) then Renders a white box of size 41x14 starting at (7, 96).
; PLAN: r0=21(x1), r1=109(y1), r2=45(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=96(y), r7=41(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 109
LDI r2, 45
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 96
LDI r7, 41
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
