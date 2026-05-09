; DESCRIPTION: Composite: Places a white line segment connecting (159, 215) to (363, 70) then Renders a cyan box of size 71x43 starting at (81, 80).
; PLAN: r0=159(x1), r1=215(y1), r2=363(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=80(y), r7=71(width), r8=43(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 215
LDI r2, 363
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 80
LDI r7, 71
LDI r8, 43
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
