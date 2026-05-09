; DESCRIPTION: Composite: Places a orange circle of radius 41 at center (130, 161) then Places a cyan line segment connecting (400, 45) to (169, 54).
; PLAN: r0=130(x), r1=161(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x1), r6=45(y1), r7=169(x2), r8=54(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 161
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 45
LDI r7, 169
LDI r8, 54
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
