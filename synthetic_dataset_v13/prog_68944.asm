; DESCRIPTION: Composite: Draws a magenta line from (420, 226) to (232, 159) then Renders a purple box of size 113x27 starting at (16, 39).
; PLAN: r0=420(x1), r1=226(y1), r2=232(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=39(y), r7=113(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 226
LDI r2, 232
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 39
LDI r7, 113
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
