; DESCRIPTION: Composite: Creates a cyan circular shape at (138, 172) with radius 76 then Renders a white box of size 37x66 starting at (349, 42) then Draws a blue line from (445, 172) to (417, 213).
; PLAN: r0=138(x), r1=172(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=42(y), r7=37(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x1), r11=172(y1), r12=417(x2), r13=213(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 172
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 42
LDI r7, 37
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 172
LDI r12, 417
LDI r13, 213
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
