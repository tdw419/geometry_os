; DESCRIPTION: Composite: Places a purple 101x93 rectangle at position (291, 89) then Draws a purple line from (386, 82) to (108, 111).
; PLAN: r0=291(x), r1=89(y), r2=101(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x1), r6=82(y1), r7=108(x2), r8=111(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 89
LDI r2, 101
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 82
LDI r7, 108
LDI r8, 111
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
