; DESCRIPTION: Composite: Places a magenta line segment connecting (110, 189) to (368, 13) then Renders a orange box of size 27x24 starting at (90, 225).
; PLAN: r0=110(x1), r1=189(y1), r2=368(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=225(y), r7=27(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 189
LDI r2, 368
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 225
LDI r7, 27
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
