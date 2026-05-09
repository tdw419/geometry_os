; DESCRIPTION: Composite: Draws a white line from (233, 125) to (197, 247) then Renders a green box of size 55x22 starting at (242, 183) then Places a purple dot at position (485, 200).
; PLAN: r0=233(x1), r1=125(y1), r2=197(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=183(y), r7=55(width), r8=22(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=485(x), r11=200(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 233
LDI r1, 125
LDI r2, 197
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 183
LDI r7, 55
LDI r8, 22
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 485
LDI r11, 200
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
