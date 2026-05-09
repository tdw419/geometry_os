; DESCRIPTION: Composite: Places a magenta line segment connecting (481, 61) to (473, 33) then Places a white circle of radius 50 at center (458, 117).
; PLAN: r0=481(x1), r1=61(y1), r2=473(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=117(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 61
LDI r2, 473
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 117
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
