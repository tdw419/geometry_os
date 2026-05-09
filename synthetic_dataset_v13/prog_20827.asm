; DESCRIPTION: Composite: Draws a white rectangle at (48, 216) with width 15 and height 10 then Draws a cyan line from (271, 128) to (492, 195).
; PLAN: r0=48(x), r1=216(y), r2=15(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=128(y1), r7=492(x2), r8=195(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 216
LDI r2, 15
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 128
LDI r7, 492
LDI r8, 195
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
