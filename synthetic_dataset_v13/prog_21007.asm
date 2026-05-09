; DESCRIPTION: Composite: Draws a black rectangle at (143, 10) with width 64 and height 38 then Draws a yellow line from (284, 193) to (148, 61) then Sets a single cyan pixel at (391, 132).
; PLAN: r0=143(x), r1=10(y), r2=64(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x1), r6=193(y1), r7=148(x2), r8=61(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=132(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 10
LDI r2, 64
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 193
LDI r7, 148
LDI r8, 61
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 132
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
