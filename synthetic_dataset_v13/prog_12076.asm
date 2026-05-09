; DESCRIPTION: Composite: Places a magenta dot at position (281, 146) then Renders a cyan box of size 55x117 starting at (249, 10) then Renders a purple line between points (480, 238) and (494, 220).
; PLAN: r0=281(x), r1=146(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=10(y), r7=55(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=480(x1), r11=238(y1), r12=494(x2), r13=220(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 146
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 10
LDI r7, 55
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 480
LDI r11, 238
LDI r12, 494
LDI r13, 220
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
