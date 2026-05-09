; DESCRIPTION: Composite: Places a magenta 113x33 rectangle at position (374, 5) then Places a white circle of radius 34 at center (210, 68) then Renders a cyan line between points (106, 47) and (99, 231).
; PLAN: r0=374(x), r1=5(y), r2=113(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=68(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x1), r11=47(y1), r12=99(x2), r13=231(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 5
LDI r2, 113
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 68
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 47
LDI r12, 99
LDI r13, 231
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
