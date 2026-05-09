; DESCRIPTION: Composite: Renders a yellow line between points (275, 144) and (177, 37) then Renders a black box of size 113x14 starting at (20, 37).
; PLAN: r0=275(x1), r1=144(y1), r2=177(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=37(y), r7=113(width), r8=14(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 144
LDI r2, 177
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 37
LDI r7, 113
LDI r8, 14
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
