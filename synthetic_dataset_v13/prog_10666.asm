; DESCRIPTION: Composite: Sets a single cyan pixel at (435, 130) then Draws a green line from (212, 198) to (135, 254) then Places a cyan 93x20 rectangle at position (284, 11).
; PLAN: r0=435(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=212(x1), r6=198(y1), r7=135(x2), r8=254(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=284(x), r11=11(y), r12=93(width), r13=20(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 435
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 212
LDI r6, 198
LDI r7, 135
LDI r8, 254
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 11
LDI r12, 93
LDI r13, 20
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
