; DESCRIPTION: Composite: Places a cyan 48x21 rectangle at position (370, 64) then Places a black line segment connecting (146, 133) to (21, 138).
; PLAN: r0=370(x), r1=64(y), r2=48(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=146(x1), r6=133(y1), r7=21(x2), r8=138(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 64
LDI r2, 48
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 133
LDI r7, 21
LDI r8, 138
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
