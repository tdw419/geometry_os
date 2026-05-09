; DESCRIPTION: Composite: Places a cyan dot at position (42, 187) then Renders a purple box of size 47x27 starting at (341, 188) then Places a blue line segment connecting (500, 45) to (475, 164).
; PLAN: r0=42(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=188(y), r7=47(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=500(x1), r11=45(y1), r12=475(x2), r13=164(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 188
LDI r7, 47
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 45
LDI r12, 475
LDI r13, 164
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
