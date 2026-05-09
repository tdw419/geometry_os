; DESCRIPTION: Composite: Places a cyan dot at position (279, 62) then Places a red line segment connecting (103, 130) to (164, 212) then Renders a black box of size 113x24 starting at (225, 16).
; PLAN: r0=279(x), r1=62(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=103(x1), r6=130(y1), r7=164(x2), r8=212(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=16(y), r12=113(width), r13=24(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 62
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 130
LDI r7, 164
LDI r8, 212
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 16
LDI r12, 113
LDI r13, 24
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
