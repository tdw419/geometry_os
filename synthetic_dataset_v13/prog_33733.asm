; DESCRIPTION: Composite: Renders a orange box of size 103x95 starting at (286, 151) then Draws a magenta line from (420, 2) to (174, 24).
; PLAN: r0=286(x), r1=151(y), r2=103(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=2(y1), r7=174(x2), r8=24(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 151
LDI r2, 103
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 2
LDI r7, 174
LDI r8, 24
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
