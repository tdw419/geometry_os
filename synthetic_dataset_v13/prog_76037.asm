; DESCRIPTION: Composite: Places a red dot at position (74, 45) then Draws a red line from (275, 152) to (414, 194) then Places a purple 120x92 rectangle at position (197, 139).
; PLAN: r0=74(x), r1=45(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=152(y1), r7=414(x2), r8=194(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=139(y), r12=120(width), r13=92(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 45
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 275
LDI r6, 152
LDI r7, 414
LDI r8, 194
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 139
LDI r12, 120
LDI r13, 92
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
