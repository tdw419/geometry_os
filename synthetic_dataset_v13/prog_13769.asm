; DESCRIPTION: Composite: Places a green 89x113 rectangle at position (127, 107) then Places a green line segment connecting (89, 67) to (197, 102).
; PLAN: r0=127(x), r1=107(y), r2=89(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x1), r6=67(y1), r7=197(x2), r8=102(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 107
LDI r2, 89
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 67
LDI r7, 197
LDI r8, 102
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
