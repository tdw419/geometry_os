; DESCRIPTION: Composite: Renders a white box of size 81x77 starting at (51, 168) then Places a white line segment connecting (147, 60) to (386, 187) then Places a cyan dot at position (32, 180).
; PLAN: r0=51(x), r1=168(y), r2=81(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x1), r6=60(y1), r7=386(x2), r8=187(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=180(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 168
LDI r2, 81
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 60
LDI r7, 386
LDI r8, 187
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 180
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
