; DESCRIPTION: Composite: Renders a cyan box of size 79x116 starting at (415, 92) then Renders a cyan line between points (215, 137) and (18, 148) then Sets a single black pixel at (429, 102).
; PLAN: r0=415(x), r1=92(y), r2=79(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x1), r6=137(y1), r7=18(x2), r8=148(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=102(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 92
LDI r2, 79
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 137
LDI r7, 18
LDI r8, 148
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 102
LDI r12, 0x000000
PSET r10, r11, r12
HALT
