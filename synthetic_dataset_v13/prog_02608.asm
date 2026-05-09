; DESCRIPTION: Composite: Places a red dot at position (182, 197) then Renders a magenta box of size 118x18 starting at (150, 48) then Places a cyan line segment connecting (511, 12) to (494, 231).
; PLAN: r0=182(x), r1=197(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=48(y), r7=118(width), r8=18(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=511(x1), r11=12(y1), r12=494(x2), r13=231(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 197
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 150
LDI r6, 48
LDI r7, 118
LDI r8, 18
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 511
LDI r11, 12
LDI r12, 494
LDI r13, 231
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
