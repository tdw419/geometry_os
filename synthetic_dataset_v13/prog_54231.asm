; DESCRIPTION: Composite: Places a cyan line segment connecting (455, 170) to (279, 89) then Renders a magenta box of size 108x26 starting at (269, 37).
; PLAN: r0=455(x1), r1=170(y1), r2=279(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=37(y), r7=108(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 170
LDI r2, 279
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 37
LDI r7, 108
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
