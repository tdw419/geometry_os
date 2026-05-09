; DESCRIPTION: Composite: Renders a green line between points (499, 216) and (493, 228) then Renders a purple box of size 102x100 starting at (38, 71).
; PLAN: r0=499(x1), r1=216(y1), r2=493(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=71(y), r7=102(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 216
LDI r2, 493
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 71
LDI r7, 102
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
