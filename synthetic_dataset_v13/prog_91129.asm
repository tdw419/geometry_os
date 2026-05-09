; DESCRIPTION: Composite: Renders a blue box of size 14x16 starting at (28, 176) then Draws a cyan line from (347, 143) to (197, 210).
; PLAN: r0=28(x), r1=176(y), r2=14(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=143(y1), r7=197(x2), r8=210(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 176
LDI r2, 14
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 143
LDI r7, 197
LDI r8, 210
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
