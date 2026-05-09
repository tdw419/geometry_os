; DESCRIPTION: Composite: Draws a blue rectangle at (413, 13) with width 31 and height 114 then Places a magenta dot at position (458, 255) then Draws a cyan line from (317, 2) to (305, 215).
; PLAN: r0=413(x), r1=13(y), r2=31(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=255(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=317(x1), r11=2(y1), r12=305(x2), r13=215(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 13
LDI r2, 31
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 255
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 317
LDI r11, 2
LDI r12, 305
LDI r13, 215
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
