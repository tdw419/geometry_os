; DESCRIPTION: Composite: Places a white circle of radius 31 at center (395, 191) then Places a red line segment connecting (303, 173) to (199, 215).
; PLAN: r0=395(x), r1=191(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x1), r6=173(y1), r7=199(x2), r8=215(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 191
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 173
LDI r7, 199
LDI r8, 215
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
