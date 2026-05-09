; DESCRIPTION: Composite: Draws a orange line from (190, 39) to (245, 103) then Places a red 91x11 rectangle at position (33, 143).
; PLAN: r0=190(x1), r1=39(y1), r2=245(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=143(y), r7=91(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 39
LDI r2, 245
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 143
LDI r7, 91
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
