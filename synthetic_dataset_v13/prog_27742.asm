; DESCRIPTION: Composite: Places a purple 103x64 rectangle at position (101, 149) then Renders a cyan line between points (255, 5) and (276, 17) then Places a yellow dot at position (90, 213).
; PLAN: r0=101(x), r1=149(y), r2=103(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x1), r6=5(y1), r7=276(x2), r8=17(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=213(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 149
LDI r2, 103
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 5
LDI r7, 276
LDI r8, 17
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 213
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
