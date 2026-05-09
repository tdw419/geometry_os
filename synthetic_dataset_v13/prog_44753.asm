; DESCRIPTION: Composite: Places a blue 114x119 rectangle at position (210, 53) then Draws a blue line from (479, 69) to (493, 97).
; PLAN: r0=210(x), r1=53(y), r2=114(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x1), r6=69(y1), r7=493(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 53
LDI r2, 114
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 69
LDI r7, 493
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
