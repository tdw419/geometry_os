; DESCRIPTION: Composite: Sets a single cyan pixel at (277, 75) then Places a cyan line segment connecting (60, 135) to (71, 223) then Renders a green box of size 60x14 starting at (406, 102).
; PLAN: r0=277(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=60(x1), r6=135(y1), r7=71(x2), r8=223(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=102(y), r12=60(width), r13=14(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 135
LDI r7, 71
LDI r8, 223
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 102
LDI r12, 60
LDI r13, 14
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
