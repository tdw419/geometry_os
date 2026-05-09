; DESCRIPTION: Composite: Draws a orange line from (183, 233) to (288, 223) then Places a red dot at position (481, 42).
; PLAN: r0=183(x1), r1=233(y1), r2=288(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=481(x), r6=42(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 233
LDI r2, 288
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 42
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
