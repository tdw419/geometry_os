; DESCRIPTION: Composite: Draws a red line from (222, 176) to (354, 168) then Places a red 41x82 rectangle at position (418, 61).
; PLAN: r0=222(x1), r1=176(y1), r2=354(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=61(y), r7=41(width), r8=82(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 176
LDI r2, 354
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 61
LDI r7, 41
LDI r8, 82
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
