; DESCRIPTION: Composite: Renders a cyan line between points (84, 79) and (508, 28) then Renders a blue box of size 21x21 starting at (286, 113).
; PLAN: r0=84(x1), r1=79(y1), r2=508(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=113(y), r7=21(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 79
LDI r2, 508
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 113
LDI r7, 21
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
