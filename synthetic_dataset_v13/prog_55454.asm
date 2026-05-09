; DESCRIPTION: Composite: Renders a yellow box of size 46x47 starting at (17, 48) then Draws a white line from (286, 213) to (414, 242).
; PLAN: r0=17(x), r1=48(y), r2=46(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x1), r6=213(y1), r7=414(x2), r8=242(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 48
LDI r2, 46
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 213
LDI r7, 414
LDI r8, 242
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
