; DESCRIPTION: Composite: Draws a black line from (200, 83) to (94, 249) then Renders a magenta box of size 92x71 starting at (416, 52).
; PLAN: r0=200(x1), r1=83(y1), r2=94(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=52(y), r7=92(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 83
LDI r2, 94
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 52
LDI r7, 92
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
