; DESCRIPTION: Composite: Places a green line segment connecting (400, 59) to (505, 96) then Places a green 29x43 rectangle at position (269, 180).
; PLAN: r0=400(x1), r1=59(y1), r2=505(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=180(y), r7=29(width), r8=43(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 59
LDI r2, 505
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 180
LDI r7, 29
LDI r8, 43
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
