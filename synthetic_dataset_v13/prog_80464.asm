; DESCRIPTION: Composite: Places a purple line segment connecting (22, 208) to (137, 245) then Places a cyan 24x64 rectangle at position (5, 25).
; PLAN: r0=22(x1), r1=208(y1), r2=137(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=25(y), r7=24(width), r8=64(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 208
LDI r2, 137
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 25
LDI r7, 24
LDI r8, 64
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
