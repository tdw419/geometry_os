; DESCRIPTION: Composite: Renders a white box of size 41x30 starting at (294, 33) then Draws a red line from (429, 228) to (331, 11).
; PLAN: r0=294(x), r1=33(y), r2=41(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x1), r6=228(y1), r7=331(x2), r8=11(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 33
LDI r2, 41
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 228
LDI r7, 331
LDI r8, 11
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
