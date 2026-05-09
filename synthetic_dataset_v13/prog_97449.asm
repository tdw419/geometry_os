; DESCRIPTION: Composite: Draws a green line from (398, 74) to (130, 34) then Places a cyan 63x97 rectangle at position (148, 150).
; PLAN: r0=398(x1), r1=74(y1), r2=130(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=150(y), r7=63(width), r8=97(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 74
LDI r2, 130
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 150
LDI r7, 63
LDI r8, 97
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
