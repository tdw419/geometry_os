; DESCRIPTION: Composite: Renders a red box of size 74x42 starting at (236, 4) then Draws a red line from (156, 33) to (293, 197).
; PLAN: r0=236(x), r1=4(y), r2=74(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x1), r6=33(y1), r7=293(x2), r8=197(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 4
LDI r2, 74
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 33
LDI r7, 293
LDI r8, 197
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
