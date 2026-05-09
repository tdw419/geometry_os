; DESCRIPTION: Composite: Draws a cyan line from (509, 150) to (330, 159) then Renders a black box of size 46x78 starting at (202, 10).
; PLAN: r0=509(x1), r1=150(y1), r2=330(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=10(y), r7=46(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 150
LDI r2, 330
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 10
LDI r7, 46
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
