; DESCRIPTION: Composite: Draws a magenta rectangle at (50, 1) with width 18 and height 51 then Draws a white line from (46, 45) to (144, 96) then Places a green dot at position (502, 251).
; PLAN: r0=50(x), r1=1(y), r2=18(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x1), r6=45(y1), r7=144(x2), r8=96(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=502(x), r11=251(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 1
LDI r2, 18
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 45
LDI r7, 144
LDI r8, 96
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 251
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
