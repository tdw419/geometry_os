; DESCRIPTION: Composite: Sets a single white pixel at (450, 218) then Draws a green rectangle at (219, 73) with width 10 and height 59 then Draws a cyan line from (239, 82) to (80, 96).
; PLAN: r0=450(x), r1=218(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=73(y), r7=10(width), r8=59(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x1), r11=82(y1), r12=80(x2), r13=96(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 218
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 73
LDI r7, 10
LDI r8, 59
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 82
LDI r12, 80
LDI r13, 96
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
