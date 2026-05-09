; DESCRIPTION: Composite: Places a white dot at position (332, 214) then Places a cyan line segment connecting (413, 70) to (485, 8).
; PLAN: r0=332(x), r1=214(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=413(x1), r6=70(y1), r7=485(x2), r8=8(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 214
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 70
LDI r7, 485
LDI r8, 8
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
