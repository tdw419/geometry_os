; DESCRIPTION: Composite: Draws a white line from (169, 124) to (485, 174) then Places a blue 82x24 rectangle at position (394, 44) then Places a green dot at position (479, 252).
; PLAN: r0=169(x1), r1=124(y1), r2=485(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=44(y), r7=82(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=252(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 124
LDI r2, 485
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 44
LDI r7, 82
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 252
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
