; DESCRIPTION: Composite: Draws a green line from (73, 10) to (180, 52) then Draws a cyan rectangle at (242, 102) with width 65 and height 97.
; PLAN: r0=73(x1), r1=10(y1), r2=180(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=102(y), r7=65(width), r8=97(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 10
LDI r2, 180
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 102
LDI r7, 65
LDI r8, 97
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
