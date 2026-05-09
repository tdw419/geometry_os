; DESCRIPTION: Composite: Renders a cyan line between points (140, 220) and (174, 57) then Renders a orange box of size 100x15 starting at (28, 84).
; PLAN: r0=140(x1), r1=220(y1), r2=174(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=28(x), r6=84(y), r7=100(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 220
LDI r2, 174
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 84
LDI r7, 100
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
