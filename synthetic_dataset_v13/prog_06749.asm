; DESCRIPTION: Composite: Renders a purple box of size 120x120 starting at (254, 117) then Places a purple line segment connecting (275, 17) to (160, 242).
; PLAN: r0=254(x), r1=117(y), r2=120(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=17(y1), r7=160(x2), r8=242(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 117
LDI r2, 120
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 17
LDI r7, 160
LDI r8, 242
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
