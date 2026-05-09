; DESCRIPTION: Composite: Places a orange 10x45 rectangle at position (168, 144) then Places a cyan line segment connecting (266, 149) to (64, 99).
; PLAN: r0=168(x), r1=144(y), r2=10(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=149(y1), r7=64(x2), r8=99(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 144
LDI r2, 10
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 149
LDI r7, 64
LDI r8, 99
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
