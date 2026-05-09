; DESCRIPTION: Composite: Sets a single white pixel at (382, 59) then Renders a white box of size 15x62 starting at (320, 67) then Places a cyan line segment connecting (292, 38) to (98, 7).
; PLAN: r0=382(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=67(y), r7=15(width), r8=62(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x1), r11=38(y1), r12=98(x2), r13=7(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 67
LDI r7, 15
LDI r8, 62
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 38
LDI r12, 98
LDI r13, 7
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
