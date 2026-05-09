; DESCRIPTION: Composite: Renders a green disk with center (326, 158) and radius 77 then Draws a white line from (279, 97) to (135, 135) then Places a cyan 19x11 rectangle at position (394, 73).
; PLAN: r0=326(x), r1=158(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x1), r6=97(y1), r7=135(x2), r8=135(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=73(y), r12=19(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 158
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 97
LDI r7, 135
LDI r8, 135
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 73
LDI r12, 19
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
