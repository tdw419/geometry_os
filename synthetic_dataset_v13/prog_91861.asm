; DESCRIPTION: Composite: Places a purple line segment connecting (178, 135) to (416, 209) then Places a cyan 39x45 rectangle at position (329, 163).
; PLAN: r0=178(x1), r1=135(y1), r2=416(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=163(y), r7=39(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 135
LDI r2, 416
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 163
LDI r7, 39
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
