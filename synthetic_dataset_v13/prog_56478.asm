; DESCRIPTION: Composite: Places a yellow line segment connecting (10, 231) to (285, 237) then Renders a cyan box of size 66x70 starting at (38, 164).
; PLAN: r0=10(x1), r1=231(y1), r2=285(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=164(y), r7=66(width), r8=70(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 231
LDI r2, 285
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 164
LDI r7, 66
LDI r8, 70
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
