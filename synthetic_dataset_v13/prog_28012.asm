; DESCRIPTION: Composite: Renders a orange disk with center (85, 120) and radius 77 then Draws a orange line from (284, 42) to (445, 98).
; PLAN: r0=85(x), r1=120(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x1), r6=42(y1), r7=445(x2), r8=98(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 120
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 42
LDI r7, 445
LDI r8, 98
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
