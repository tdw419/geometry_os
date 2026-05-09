; DESCRIPTION: Composite: Places a yellow line segment connecting (431, 22) to (39, 93) then Renders a green box of size 21x113 starting at (455, 18).
; PLAN: r0=431(x1), r1=22(y1), r2=39(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=18(y), r7=21(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 22
LDI r2, 39
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 18
LDI r7, 21
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
