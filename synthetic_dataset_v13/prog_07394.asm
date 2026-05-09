; DESCRIPTION: Composite: Draws a orange line from (114, 150) to (303, 205) then Renders a red box of size 18x77 starting at (270, 50) then Sets a single cyan pixel at (420, 225).
; PLAN: r0=114(x1), r1=150(y1), r2=303(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=50(y), r7=18(width), r8=77(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=420(x), r11=225(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 114
LDI r1, 150
LDI r2, 303
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 50
LDI r7, 18
LDI r8, 77
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 225
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
