; DESCRIPTION: Composite: Places a green 33x21 rectangle at position (366, 73) then Places a cyan line segment connecting (231, 92) to (264, 19).
; PLAN: r0=366(x), r1=73(y), r2=33(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x1), r6=92(y1), r7=264(x2), r8=19(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 73
LDI r2, 33
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 92
LDI r7, 264
LDI r8, 19
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
