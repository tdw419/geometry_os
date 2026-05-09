; DESCRIPTION: Composite: Places a cyan line segment connecting (50, 57) to (103, 116) then Places a green 18x86 rectangle at position (110, 155) then Places a magenta dot at position (54, 35).
; PLAN: r0=50(x1), r1=57(y1), r2=103(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=155(y), r7=18(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x), r11=35(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 57
LDI r2, 103
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 155
LDI r7, 18
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 35
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
