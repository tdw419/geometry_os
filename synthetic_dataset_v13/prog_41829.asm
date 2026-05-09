; DESCRIPTION: Composite: Places a magenta 103x72 rectangle at position (192, 130) then Draws a cyan line from (412, 44) to (322, 148).
; PLAN: r0=192(x), r1=130(y), r2=103(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=44(y1), r7=322(x2), r8=148(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 130
LDI r2, 103
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 44
LDI r7, 322
LDI r8, 148
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
