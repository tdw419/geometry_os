; DESCRIPTION: Composite: Places a cyan line segment connecting (279, 157) to (493, 66) then Places a yellow 69x89 rectangle at position (267, 146).
; PLAN: r0=279(x1), r1=157(y1), r2=493(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=146(y), r7=69(width), r8=89(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 157
LDI r2, 493
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 146
LDI r7, 69
LDI r8, 89
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
