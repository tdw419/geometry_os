; DESCRIPTION: Composite: Creates a red circular shape at (370, 28) with radius 27 then Places a green 71x99 rectangle at position (246, 31) then Renders a yellow line between points (479, 227) and (313, 15).
; PLAN: r0=370(x), r1=28(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=31(y), r7=71(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x1), r11=227(y1), r12=313(x2), r13=15(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 28
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 31
LDI r7, 71
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 227
LDI r12, 313
LDI r13, 15
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
