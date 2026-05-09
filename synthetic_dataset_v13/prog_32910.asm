; DESCRIPTION: Composite: Places a black 71x64 rectangle at position (111, 127) then Draws a cyan line from (190, 120) to (256, 220) then Sets a single white pixel at (260, 117).
; PLAN: r0=111(x), r1=127(y), r2=71(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x1), r6=120(y1), r7=256(x2), r8=220(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=117(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 111
LDI r1, 127
LDI r2, 71
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 120
LDI r7, 256
LDI r8, 220
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 117
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
