; DESCRIPTION: Composite: Renders a orange line between points (383, 227) and (268, 195) then Places a orange 116x111 rectangle at position (301, 93).
; PLAN: r0=383(x1), r1=227(y1), r2=268(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=93(y), r7=116(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 227
LDI r2, 268
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 93
LDI r7, 116
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
