; DESCRIPTION: Composite: Places a cyan 50x62 rectangle at position (212, 54) then Places a magenta dot at position (365, 127) then Places a yellow line segment connecting (140, 238) to (160, 241).
; PLAN: r0=212(x), r1=54(y), r2=50(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=127(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=140(x1), r11=238(y1), r12=160(x2), r13=241(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 54
LDI r2, 50
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 127
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 140
LDI r11, 238
LDI r12, 160
LDI r13, 241
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
