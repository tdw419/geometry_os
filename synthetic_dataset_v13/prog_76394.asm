; DESCRIPTION: Composite: Places a magenta dot at position (463, 38) then Draws a blue line from (268, 224) to (415, 5) then Renders a cyan box of size 72x120 starting at (115, 38).
; PLAN: r0=463(x), r1=38(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=268(x1), r6=224(y1), r7=415(x2), r8=5(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=38(y), r12=72(width), r13=120(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 38
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 268
LDI r6, 224
LDI r7, 415
LDI r8, 5
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 38
LDI r12, 72
LDI r13, 120
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
