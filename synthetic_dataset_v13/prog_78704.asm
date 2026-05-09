; DESCRIPTION: Composite: Places a white 47x90 rectangle at position (368, 29) then Places a white line segment connecting (215, 59) to (182, 184) then Places a white dot at position (190, 226).
; PLAN: r0=368(x), r1=29(y), r2=47(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x1), r6=59(y1), r7=182(x2), r8=184(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=190(x), r11=226(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 29
LDI r2, 47
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 59
LDI r7, 182
LDI r8, 184
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 226
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
