; DESCRIPTION: Composite: Renders a black box of size 84x64 starting at (352, 135) then Draws a cyan line from (95, 35) to (217, 211) then Places a white dot at position (65, 182).
; PLAN: r0=352(x), r1=135(y), r2=84(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x1), r6=35(y1), r7=217(x2), r8=211(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=65(x), r11=182(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 135
LDI r2, 84
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 35
LDI r7, 217
LDI r8, 211
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 182
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
