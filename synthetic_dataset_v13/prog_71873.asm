; DESCRIPTION: Composite: Sets a single blue pixel at (317, 231) then Draws a magenta rectangle at (73, 93) with width 32 and height 83 then Draws a cyan line from (370, 24) to (503, 56).
; PLAN: r0=317(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=93(y), r7=32(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x1), r11=24(y1), r12=503(x2), r13=56(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 93
LDI r7, 32
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 24
LDI r12, 503
LDI r13, 56
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
