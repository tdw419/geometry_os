; DESCRIPTION: Composite: Places a red dot at position (385, 239) then Places a purple 57x48 rectangle at position (382, 154) then Draws a red line from (85, 166) to (124, 76).
; PLAN: r0=385(x), r1=239(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=154(y), r7=57(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x1), r11=166(y1), r12=124(x2), r13=76(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 239
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 382
LDI r6, 154
LDI r7, 57
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 166
LDI r12, 124
LDI r13, 76
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
