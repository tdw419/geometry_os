; DESCRIPTION: Composite: Places a magenta 101x54 rectangle at position (69, 28) then Renders a purple disk with center (121, 204) and radius 34 then Renders a cyan line between points (228, 29) and (299, 132).
; PLAN: r0=69(x), r1=28(y), r2=101(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=204(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x1), r11=29(y1), r12=299(x2), r13=132(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 28
LDI r2, 101
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 204
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 29
LDI r12, 299
LDI r13, 132
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
