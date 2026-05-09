; DESCRIPTION: Composite: Places a cyan circle of radius 74 at center (297, 98) then Renders a blue box of size 49x29 starting at (28, 66) then Draws a cyan line from (255, 154) to (446, 107).
; PLAN: r0=297(x), r1=98(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=66(y), r7=49(width), r8=29(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x1), r11=154(y1), r12=446(x2), r13=107(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 98
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 66
LDI r7, 49
LDI r8, 29
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 154
LDI r12, 446
LDI r13, 107
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
