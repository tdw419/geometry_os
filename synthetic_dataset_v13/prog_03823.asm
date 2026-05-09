; DESCRIPTION: Composite: Draws a orange circle centered at (337, 119) with radius 25 then Places a white line segment connecting (410, 42) to (400, 103).
; PLAN: r0=337(x), r1=119(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x1), r6=42(y1), r7=400(x2), r8=103(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 119
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 42
LDI r7, 400
LDI r8, 103
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
